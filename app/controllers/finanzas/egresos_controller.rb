class Finanzas::EgresosController < ApplicationController
    def index
        @ingreso = Ingreso.where(tipo:2)
        @fecha1 = Date.today
        @fecha2 = Date.today
        if params[:inicio].present? && params[:fin].present?
            @ingreso = Ingreso.where(tipo:2,fecha: (params[:inicio] .. params[:fin]))
            @fecha1 = params[:inicio]
            @fecha2 = params[:fin]
        end
    end
    def new
        @ingreso = Ingreso.new
        @categoria = Categorium.where(tipo:2)
       
    end
    def create
        @ingreso = Ingreso.new (get_params)
        if @ingreso.save
            redirect_to '/egresos'
        else
            render :new ,status: :unprocessable_entity
        end
    end
    def edit
        @ingreso = Ingreso.find(params[:id])
        @categoria = Categorium.where(tipo:2)
    end
    def update
        @ingreso = Ingreso.find_by(id:[params[:id]])
        if @ingreso.update(get_params)
            redirect_to '/egresos'
        else
            render :edit, status: :unprocessable_entity
        end
    end
    def destroy
        @ingreso = Ingreso.find_by(id:[params[:id]])
        @ingreso.destroy

        redirect_to '/egresos' 
    end
    private
    def get_params
        params.require(:ingreso).permit(:id_categoria,:fecha,:monto,:comentario,:tipo)
    end
end