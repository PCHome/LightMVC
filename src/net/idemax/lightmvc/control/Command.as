////////////////////////////////////////////////////////////////////////////////
//
//    Idemax Green 
//    www.idemax.net 
//    @idemax 
//
////////////////////////////////////////////////////////////////////////////////

package net.idemax.lightmvc.control
{
    import net.idemax.lightmvc.core.abstracts.AbstractLightMVCComponent;
    import net.idemax.lightmvc.core.abstracts.interfaces.ILightMVCComponent;

    /**
     * Command (controller).
     *
     * @author Idemax
     *
     */
    public class Command extends AbstractLightMVCComponent implements ILightMVCComponent
    {
        private var _data:Object;

        /**
         * Construtor.
         *
         * @param $data Dados genéricos que podem ser passados ao Command em sua criação.
         *
         */
        public function Command( $data:Object = null )
        {
            super( this );

            _data = $data;
        }

        /**
         * Dado do command.
         *
         * @return
         *
         */
        public function get data():Object
        {
            return _data;
        }

        /**
         *
         * Evocado quando o command é registrado.
         *
         */
        public function registered():void
        {
        }

        /**
         *
         * Evocado quando o command é desregistrado.
         *
         */
        public function unregistered():void
        {
        }
    }
}