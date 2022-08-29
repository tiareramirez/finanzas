class Finanzas::IngresosController < ApplicationController
    def index
        @ingreso = Ingreso.where(tipo:1)
        @fecha1 = Date.today
        @fecha2 = Date.today
        if params[:inicio].present? && params[:fin].present?
            @ingreso = Ingreso.where(tipo:1,fecha: (params[:inicio] .. params[:fin]))
            @fecha1 = params[:inicio]
            @fecha2 = params[:fin]
        end
    end
    def new
        @ingreso = Ingreso.new
        @categoria = Categorium.where(tipo:1)
        pp @categoria
    end
    def create
        @ingreso = Ingreso.new (get_params)
        if @ingreso.save
            redirect_to '/ingresos'
        else
            render :new ,status: :unprocessable_entity
        end
    end
    def edit
        @ingreso = Ingreso.find(params[:id])
        @categoria = Categorium.where(tipo:1)
    end
    def update
        @ingreso = Ingreso.find_by(id:[params[:id]])
        if @ingreso.update(get_params)
            redirect_to '/ingresos'
        else
            render :edit, status: :unprocessable_entity
        end
    end
    def destroy
        @ingreso = Ingreso.find_by(id:[params[:id]])
        @ingreso.destroy

        redirect_to '/ingresos' 
    end
    private
    def get_params
        params.require(:ingreso).permit(:id_categoria,:fecha,:monto,:comentario,:tipo)
    end
end