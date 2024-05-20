class BicicletasController < ApplicationController

    def create
        @tipo = params[:tipo_bicicleta]
        @bicicleta = nil
        case @tipo.downcase
        when 'montana'
            @bicicleta = Bicicleta.new(bicicleta_montana_params)
        when 'carretera'
            @bicicleta = Bicicleta.new(bicicleta_carretera_params)
        end

        if @bicicleta != nil && @bicicleta.save
            render json: @tarea, status: :created
        else
            render json: @tarea.errors, status: :unprocessable_entity
        end
    end

    def update
        @bicicleta = Bicicleta.find(params[:id])
    
        # Actualizar la lista de decoraciones
        if params[:decoracion]
          decoraciones = @bicicleta.decoraciones || []
          decoraciones << params[:decoracion]
          @bicicleta.decoraciones = decoraciones
        end

        # Actualizar la imagen representativa
        if params[:imagen_representativa]
            @bicicleta.imagen_representativa = params[:imagen_representativa]
        end
    
        if @bicicleta.save
          render json: @bicicleta, status: :ok
        else
          render json: @bicicleta.errors, status: :unprocessable_entity
        end
    end

    def index
        @bicis = Bicicleta.all
        if @bicis
            render json: @bicis, status: :created
        else
            render json: @bicis.errors, status: :unprocessable_entity
        end
    end

    def destroy
        bici = Bicicleta.find(params[:id])
        if bici.destroy
            head :ok
        else 
            render json: { error: "Failed to delete" }, status: :unprocessable_entity
        end
    end

    def bicicleta_carretera_params
        params.require(:bicicleta).permit(:tipo_manillar, 
                                          :tipo_frenos,
                                          :num_frenos,
                                          :tipo_transmision, 
                                          :tipo_cuadro, 
                                          :tipo_sillin,
                                          :tipo_ruedas,
                                          :num_ruedas,
                                          :imagen_representativa,
                                          :tipo_bicicleta, 
                                          decoraciones: [])
    end

    def bicicleta_montana_params
        params.require(:bicicleta).permit(:tipo_manillar, 
                                          :tipo_frenos,
                                          :num_frenos,
                                          :tipo_transmision, 
                                          :tipo_cuadro, 
                                          :tipo_sillin,
                                          :tipo_ruedas,
                                          :num_ruedas,
                                          :imagen_representativa,
                                          :tipo_bicicleta,
                                          :tipo_suspension,
                                          :num_suspensiones, 
                                          decoraciones: [])
    end

end