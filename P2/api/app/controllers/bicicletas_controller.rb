class BicicletasController < ApplicationController

    def create
        # Dilema:
        # Transferir patrones de disenio al backend??? (app/models)
        @tipo = bicicleta_params[:tipo_bicicleta]
        @bicicleta = nil
        case @tipo.downcase
        when 'montana'
            @bicicleta = BicicletaMontana.new(bicicleta_montana_params)
        when 'carretera'
            @bicicleta = BicicletaCarretera.new(bicicleta_carretera_params)
        end

        if @bicicleta != nil && @bicicleta.save
            render json: @tarea, status: :created
        else
            render json: @tarea.errors, status: :unprocessable_entity
        end
    end

    def update
        # ...
    end

    def index
        # ...
    end

    def destroy
        # ...
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
                                          :tipo_bicicleta)
    end

    def bicicleta_montana_params
        # params.require(:bicicleta).permit(:tipo_manillar, 
        #                                   :tipo_frenos,
        #                                   :num_frenos,
        #                                   :tipo_transmision, 
        #                                   :tipo_cuadro, 
        #                                   :tipo_sillin,
        #                                   :tipo_ruedas,
        #                                   :num_ruedas,
        #                                   :imagen_representativa,
        #                                   :tipo_bicicleta)
        bicicleta_carretera_params.permit(:tipo_suspension,
                                          :num_suspensiones)
    end

end
