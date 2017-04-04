class TestSite

  def home
    TestHomePage.new
  end

  def signin
    SigninPage.new
  end

  def register
    RegisterPage.new
  end

  def landing
    LandingPage.new
  end

  def dashboard
    DashboardPage.new
  end

  def new_registration
    NewRegistrationPage.new
  end

  def card_payment
    CardPaymentPage.new
  end


end

