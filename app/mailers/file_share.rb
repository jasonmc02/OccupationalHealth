class FileShare < ActionMailer::Base
  
  default from: Rails.configuration.smtp_default_email
  
  def file_shared(params)
    @params = params
    mail(
      to: params[:shared_to], 
      subject: I18n.t("mailit.subjects.file_shared")
    )
  end
end