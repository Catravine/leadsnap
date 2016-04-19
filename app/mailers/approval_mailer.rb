class ApprovalMailer < ApplicationMailer

  def approved_user(user)
    headers["Message-ID"] = "<LeadSnap User Approvals>"
    headers["In-Reply-To"] = "<LeadSnap User Approvals>"
    headers["References"] = "<LeadSnap User Approvals>"

    @user = user

    mail(to: user.email, subject: "LeadSnap: You are approved, #{user.nickname}!")
  end

end
