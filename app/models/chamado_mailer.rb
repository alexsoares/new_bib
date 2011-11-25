class ChamadoMailer < ActionMailer::Base

  def notificar(chamado)
    if RAILS_ENV == "production"
      recipients chamado.unidade.email
    else
      recipients "alexandre@seducpma.com"
    end
    from  "informatica@seducpma.com"
    if RAILS_ENV == "production"
      subject "Abertura chamado técnico"
    else
      subject "Teste de abertura chamado técnico"
    end
    body :chamado => chamado
  end

  def chat(user,chat)
      if RAILS_ENV == "production"
        recipients user.email ? user.email : "alexandre@seducpma.com"
        subject "Convite para participação de Chat"
      else
       recipients "alexandre@seducpma.com"
       subject user.email ? "Teste - Convite para participação de Chat" : "Usuário sem email cadastrado - email retornado"
      end
      from  "informatica@seducpma.com"
      body :chat => chat
  end


  def forgot_password(user)
		setup_email(user)
		@subject    += 'Você solicitou a mudança da sua senha'
    if RAILS_ENV == "production"
      @body[:url]  = "http://pontuacao.seducpma.com/reset_password/#{user.password_reset_code}"
    else
      @body[:url]  = "http://localhost:3001/reset_password/#{user.password_reset_code}"
    end

	end

  def informacao(ponto)
    if RAILS_ENV == "production"
      recipients "informatica@seducpma.com"
    else
      recipients "alexandre@seducpma.com"
    end
    from  ponto.estagiario.unidade.email
    subject "Informe estagiários"
    body :ponto => ponto
  end

  def lembrete_info(mes)
    if RAILS_ENV == "production"
      recipients "informatica@seducpma.com"
    else
      recipients "alexandre@seducpma.com"
    end
    if RAILS_ENV == "production"
      subject "Urgente!!! Cadastrar Mês Base"
    else
      subject "TESTE: Urgente!!! Cadastrar Mês Base"
    end
    body :mes => mes
  end

  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "no-reply@ribeirosoares.com"
      @subject     = "Esqueceu sua senha "
      @sent_on     = Time.now
      @body[:user] = user
    end
end
