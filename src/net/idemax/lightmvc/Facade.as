////////////////////////////////////////////////////////////////////////////////
//
//    Idemax Green 
//    www.idemax.net 
//    @idemax 
//
////////////////////////////////////////////////////////////////////////////////

package net.idemax.lightmvc
{
    import flash.display.DisplayObject;
    import flash.errors.IllegalOperationError;

    import net.idemax.lightmvc.core.abstracts.AbstractLightMVCComponent;

    /**
     * Fachada da aplicação, onde será registrado o mediator da classe principal.
     *
     * @author Idemax
     *
     */
    public final class Facade extends AbstractLightMVCComponent
    {
        private static var _instance:Facade;

        /**
         * Construtor.
         *
         * @param $applicationMediator Mediator principal.
         * @param $application Geralmente o this (classe principal).
         *
         */
        public function Facade( $applicationMediator:Class, $application:DisplayObject )
        {
            super( this );

            if( !_instance )
            {
                _instance = this;

                registerMediator( $applicationMediator, $application );
            }
            else
            {
                throw new IllegalOperationError( 'Classe singleton. Use instance.' );
            }
        }

        /**
         * Instância singleton do Facade.
         *
         * @return
         *
         */
        public static function instance():Facade
        {
            return _instance;
        }

    }
}