class ExampleMailerPreview < ActionMailer::Preview
    def hello_world
      ExampleMailer.hello_world("user@example.com")
    end
  end
  