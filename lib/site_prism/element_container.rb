module SitePrism::ElementContainer

  def element(element_name, *find_args)
    build element_name, *find_args do
      define_method element_name.to_s do
        find_first *find_args
      end
    end
  end

  def elements(collection_name, *find_args)
    build collection_name, *find_args do
      define_method collection_name.to_s do
        find_all *find_args
      end
    end
  end
  alias :collection :elements

  def section(section_name, section_class, *find_args)
    build section_name, *find_args do
      define_method section_name do
        section_class.new self, find_first(*find_args)
      end
    end
  end

  def sections(section_collection_name, section_class, *find_args)
    build section_collection_name, *find_args do
      define_method section_collection_name do
        find_all(*find_args).collect do |element|
          section_class.new self, element
        end
      end
    end
  end

  def iframe(iframe_name, iframe_page_class, selector)
    element_selector = deduce_iframe_element_selector(selector)
    scope_selector = deduce_iframe_scope_selector(selector)

    add_to_mapped_items iframe_name
    create_existence_checker iframe_name, element_selector
    create_nonexistence_checker iframe_name, element_selector
    create_waiter iframe_name, element_selector
    define_method iframe_name do |&block|
      within_frame scope_selector do
        block.call iframe_page_class.new
      end
    end
  end

  def add_to_mapped_items(item)
    @mapped_items ||= []
    @mapped_items << item.to_s
  end

  def mapped_items
    @mapped_items
  end

  private

  def build(name, *find_args)
    if find_args.empty?
      create_no_selector name
    else
      add_to_mapped_items name
      yield
    end
    add_helper_methods name, *find_args
  end

  def add_helper_methods(name, *find_args)
    create_existence_checker name, *find_args
    create_nonexistence_checker name, *find_args
    create_waiter name, *find_args
    create_visibility_waiter name, *find_args
    create_invisibility_waiter name, *find_args
  end

  def create_helper_method(proposed_method_name, *find_args)
    if find_args.empty?
      create_no_selector proposed_method_name
    else
      yield
    end
  end

  def create_existence_checker(element_name, *find_args)
    method_name = "has_#{element_name.to_s}?"
    create_helper_method method_name, *find_args do
      define_method method_name do
        Capybara.using_wait_time 0 do
          element_exists? *find_args
        end
      end
    end
  end

  def create_nonexistence_checker(element_name, *find_args)
    method_name = "has_no_#{element_name.to_s}?"
    create_helper_method method_name, *find_args do
      define_method method_name do
        Capybara.using_wait_time 0 do
          element_does_not_exist? *find_args
        end
      end
    end
  end

  def create_waiter(element_name, *find_args)
    method_name = "wait_for_#{element_name.to_s}"
    create_helper_method method_name, *find_args do
      define_method method_name do |timeout = Capybara.default_wait_time|
      Capybara.using_wait_time timeout do
        element_exists? *find_args
      end
      end
    end
  end

  def create_visibility_waiter(element_name, *find_args)
    method_name = "wait_until_#{element_name.to_s}_visible"
    create_helper_method method_name, *find_args do
      define_method method_name do |timeout = Capybara.default_wait_time|
      Timeout.timeout timeout, SitePrism::TimeOutWaitingForElementVisibility do
        Capybara.using_wait_time 0 do
          sleep 0.05 while not element_exists? *find_args, visible: true
        end
      end
      end
    end
  end

  def create_invisibility_waiter(element_name, *find_args)
    method_name = "wait_until_#{element_name.to_s}_invisible"
    create_helper_method method_name, *find_args do
      define_method method_name do |timeout = Capybara.default_wait_time|
      Timeout.timeout timeout, SitePrism::TimeOutWaitingForElementInvisibility do
        Capybara.using_wait_time 0 do
          sleep 0.05 while element_exists? *find_args, visible: true
        end
      end
      end
    end
  end

  def create_no_selector(method_name)
    define_method method_name do
      raise SitePrism::NoSelectorForElement.new("#{self.class.name} => :#{method_name} needs a selector")
    end
  end

  def deduce_iframe_scope_selector(selector)
    selector.is_a?(Integer) ? selector : selector.split("#").last
  end

  def deduce_iframe_element_selector(selector)
    selector.is_a?(Integer) ?  "iframe:nth-of-type(#{selector + 1})" : selector
  end
end

