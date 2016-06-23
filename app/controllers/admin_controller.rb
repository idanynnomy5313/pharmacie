class AdminController < ApplicationController
  def connect
    @title = "Connexion réservée à l'administrateur"
  	return if params[:password].blank?
  	return if params[:password] != "mdp35pharma\#"
  	session[:admin] = true
  	redirect_to :home, notice: 'Connexion en tant qu\'administrateur réussie.'
  end

  def logout
    admin_only
  	session[:password] = false
  	session[:admin] = false
  	redirect_to :home, notice: "Déconnexion réussie."
  end
end

def admin?
  !session[:admin].blank? && session[:admin] == true
end

def admin_only
  if !admin?
    redirect_to :home, notice: "Opération interdite"
  end
end