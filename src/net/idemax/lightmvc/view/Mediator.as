////////////////////////////////////////////////////////////////////////////////
//
//    Idemax Green 
//    www.idemax.net 
//    @idemax 
//
////////////////////////////////////////////////////////////////////////////////

package net.idemax.lightmvc.view
{
    import flash.display.DisplayObject;

    import net.idemax.lightmvc.core.abstracts.AbstractLightMVCComponent;
    import net.idemax.lightmvc.core.abstracts.interfaces.ILightMVCComponent;

    /**
     * Mediator do componente visual.
     *
     * @author Idemax
     *
     */
    public class Mediator extends AbstractLightMVCComponent implements ILightMVCComponent
    {
        private var _viewComponent:DisplayObject;

        /**
         * Construtor.
         *
         * @param $viewComponent Componente visual gerenciado pelo mediator.
         *
         */
        public function Mediator( $viewComponent:DisplayObject )
        {
            super( this );

            _viewComponent = $viewComponent;
        }

        /**
         * Componente visual do mediator.
         *
         * @return
         *
         */
        public function get viewComponent():DisplayObject
        {
            return _viewComponent;
        }

        /**
         *
         * Evocado quando o mediator é registrado.
         *
         */
        public function registered():void
        {
        }

        /**
         *
         * Evocado quando o mediator é desregistrado, automaticamente removendo todos os interesses.
         *
         */
        public function unregistered():void
        {
            unregisterAllInterests();
        }
    }
}