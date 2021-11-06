module Api
  module V1
    class SeriesController < ApplicationController
      protect_from_forgery with: :null_session

      def index
        series = Serie.all

        render json: SerieSerializer.new(series, options).serialized_json
      end

      def show
        serie = Serie.find_by(slug: params[:slug])

        render json: SerieSerializer.new(serie, options).serialized_json
      end

      def create
        serie = Serie.new(serie_params)

        if serie.save
          render json: SerieSerializer.new(serie).serialized_json
        else
          render json: {error: serie.errors.messages}, status: 422
        end
      end

      def update
        serie = Serie.find_by(slug: params[:slug])

        if serie.update(serie_params)
          render json: SerieSerializer.new(serie, options).serialized_json
        else
          render json: {error: serie.errors.messages}, status: 422
        end
      end

      def destroy
        serie = Serie.find_by(slug: params[:slug])

        if serie.destroy
          head :no_content
        else
          render json: {error: serie.errors.messages}, status: 422
        end
      end

      private 

      def serie_params
        params.permit(:name, :slug, :image_url)
      end

      def options
        @options ||= { include: %i[reviews] }
      end

    end
  end
end