require 'spec_helper'

describe SitePrism::Page do
  it "should respond to sections" do
    SitePrism::Page.should respond_to :sections
  end

  it "should create a matching existence method for sections" do
    class SomePageWithSectionsThatNeedsTestingForExistence < SitePrism::Section
    end

    class YetAnotherPageWithSections < SitePrism::Page
      section :some_things, SomePageWithSectionsThatNeedsTestingForExistence, '.bob'
    end

    page = YetAnotherPageWithSections.new
    page.should respond_to :has_some_things?
  end
end

