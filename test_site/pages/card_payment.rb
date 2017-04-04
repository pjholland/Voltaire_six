require_relative "basepage"

class CardPaymentPage < SitePrism::Page

  set_url_matcher /meaningfulplatform.co.uk\/?/

  #individual elements
  element              :card_number,                            :xpath,       '//*[@id="card-number"]'
  element              :expiry_month,                           :id,          'expiry-month'
  element              :expiry_year,                            :id,          'expiry-year'
  element              :pay_button,                             :id,          'submit-payment-form'
  element              :security_number,                        :id,          'card-cvv'


  def fill_in_card_payment
   # card_number.set '05175301250070000050'
    expiry_month.set '05'
    expiry_year.set '17'
    #security_number.set '123'

  end

end