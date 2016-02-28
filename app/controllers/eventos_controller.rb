class EventosController < ApplicationController
before_action :find_evento, only: [:show, :dashboard]
	before_action :find_invitado, only: [:show, :dashboard]

	def index
		@eventos = Evento.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 12)
	end

	def show
	end

	def dashboard
	end

	private

	def find_invitado
		@invitados = Invitado.where(evento_id: @evento).order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
	end

	def find_evento
		if params[:id].nil?
			@evento = current_evento
		else
			@evento =Evento.find(params[:id])
		end
	end
end
