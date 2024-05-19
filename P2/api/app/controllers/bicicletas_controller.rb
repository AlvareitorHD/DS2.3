# Maneja las solicitudes HTTP enviadas desde la aplicación Flutter y realiza operaciones en la base de datos.

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
        # nil es sinonimo de null
        # con save, intenta guardar en la base de datos
        if @bicicleta != nil && @bicicleta.save
            render json: @bicicleta, status: :created
        else
            render json: @bicicleta.errors, status: :unprocessable_entity
        end
    end

    def update
        @bicicleta = Bicicleta.find(params[:id])
        if @bicicleta.update(bicicleta_params)
            render json: @bicicleta, status: :ok
        else
            render json: @bicicleta.errors, status: :unprocessable_entity
        end
    end

    def index
        # ...
    end

    def destroy
        # ...
    end



    def bicicleta_params
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
    
      def bicicleta_carretera_params
        bicicleta_params
      end
    
      def bicicleta_montana_params
        bicicleta_params.merge(
          params.require(:bicicleta).permit(
            :tipo_suspension,
            :num_suspensiones
          )
        )
      end

end
