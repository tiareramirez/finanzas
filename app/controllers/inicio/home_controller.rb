class Inicio::HomeController < ApplicationController

    def show
        @categoriaIng = Categorium.where(tipo:1)
        @categoriaEgr = Categorium.where(tipo:2)
        @model = Ingreso.where(fecha:Date)
        @fecha1 = Date.today
        @fecha2 = Date.today
        if params[:inicio].present?
            @fecha1 = params[:inicio]
            @fecha2 = params[:fin]
        end
        pp "Fechas"
        pp @fecha1, @fecha2
    end
end