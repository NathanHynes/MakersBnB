require 'sendgrid-ruby'

class SendConfirm

  include SendGrid

  def send_approval_email(guest_name:, guest_email:, listing_name:, date:)
    from = Email.new(email: 'bookings@MakersBnB.com')
    to = Email.new(email: guest_email)
    subject = 'Your stay has been confirmed'
    content = Content.new(type: 'text/plain', value: "Thank you #{guest_name} for booking with MakersBnB. Your stay at #{listing_name} for #{date} has now been confirmed.")
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end

  def send_declined_email(guest_name:, guest_email:, listing_name:, date:)
    from = Email.new(email: 'bookings@MakersBnB.com')
    to = Email.new(email: guest_email)
    subject = "Problem with your recent booking"
    content = Content.new(type: 'text/plain', value: "We're sorry #{guest_name} but your booking for #{listing_name} on #{date} is no longer available. Please try a different date or select a different property.")
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end

end
