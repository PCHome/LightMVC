////////////////////////////////////////////////////////////////////////////////
//
//    Idemax Green 
//    www.idemax.net 
//    @idemax 
//
////////////////////////////////////////////////////////////////////////////////

package net.idemax.lightmvc.core.abstracts.interfaces
{

    /**
     * Interface implementada pelas classes:
     * - Proxy
     * - Mediator
     * - Command
     *
     * @author Idemax
     *
     */
    public interface ILightMVCComponent
    {
        /**
         *
         * Componente registrado no facade.
         *
         */
        function registered():void;

        /**
         *
         * Componente desregistrado do facade.
         *
         */
        function unregistered():void;
    }
}