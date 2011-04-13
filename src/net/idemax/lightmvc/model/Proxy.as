////////////////////////////////////////////////////////////////////////////////
//
//    Idemax Green 
//    www.idemax.net 
//    @idemax 
//
////////////////////////////////////////////////////////////////////////////////

package net.idemax.lightmvc.model
{
    import net.idemax.lightmvc.core.abstracts.AbstractLightMVCComponent;
    import net.idemax.lightmvc.core.abstracts.interfaces.ILightMVCComponent;

    /**
     * Proxy (model).
     *
     * @author Idemax
     *
     */
    public class Proxy extends AbstractLightMVCComponent implements ILightMVCComponent
    {
        private var _data:Object;

        /**
         * Construtor.
         *
         * @param $data Dados genéricos que podem ser passados ao Proxy em sua criação.
         *
         */
        public function Proxy( $data:Object = null )
        {
            super( this );

            _data = $data;
        }

        /**
         * Dado do proxy.
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
         * Evocado quando o proxy é registrado.
         *
         */
        public function registered():void
        {
        }

        /**
         *
         * Evocado quando o proxy é desregistrado.
         *
         */
        public function unregistered():void
        {
        }
    }
}