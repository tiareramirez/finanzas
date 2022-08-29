class Finanzas::CategoriasController < ApplicationController
    def index
        @categoria = Categorium.all
        pp @categoria
    end
    def new
        @categoria = Categorium.new
        pp @categoria
    end
    def create
        @categoria = Categorium.new (categoria_params)
        if @categoria.save
            redirect_to '/categorias'
        else
            render :new ,status: :unprocessable_entity
        end
    end
    def edit
        @categoria = Categorium.find([params[:id]])
        pp params
    end
    def update
        pp "Datos update:"
        @categoria = Categorium.find_by(id:[params[:id]])
        if @categoria.update(categoria_params)
            redirect_to '/categorias'
        else
            render :edit, status: :unprocessable_entity
        end
        
    end
    private
    def categoria_params
        params.require(:categorium).permit(:categoria, :tipo ,:icono)
    end
end