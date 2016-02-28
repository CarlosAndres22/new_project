class InvitadosController < ApplicationController
	before_action :authenticate_evento!, except: [:show]
	before_filter :require_permission
	before_action :find_evento
	before_action :find_invitado, only: [:show, :edit, :update, :destroy]

	def new
		@invitado = @evento.invitados.new
	end

	def create
		@invitado = @evento.invitados.new(invitado_params)
		if @invitado.save
			redirect_to evento_invitado_path(@evento, @invitado)
		else
			render 'new'
		end
	end

	def show
		@invitado = Invitado.where(evento_id: @evento).order("created_at DESC").limit(6).reject { |e| e.id == @invitado.id }
	end

	def edit
	end

	def update
		if @invitado.update invitado_params
			redirect_to evento_invitado_path(@evento, @invitado), notice: "Episode was succesfully updated!"
		else
			render 'edit'
		end
	end

	def destroy
		@invitado.destroy
		redirect_to root_path
	end

	private

	def invitado_params
		params.require(:invitado).permit(:title, :description, :episode_thumbnail, :mp3)
	end

	def find_evento
		@evento = Evento.find(params[:evento_id])
	end

	def find_invitado
		@invitado = Invitado.find(params[:id])
	end

	def require_permission
		@evento = Evento.find(params[:evento_id])
		if current_evento != @evento
			redirect_to root_path, notice: "Sorry, you're not allowed to view that page"
		end
	end
end

end
