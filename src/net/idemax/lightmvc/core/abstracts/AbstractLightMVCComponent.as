////////////////////////////////////////////////////////////////////////////////
//
//    Idemax Green 
//    www.idemax.net 
//    @idemax 
//
////////////////////////////////////////////////////////////////////////////////

package net.idemax.lightmvc.core.abstracts
{
    import flash.display.DisplayObject;
    import flash.errors.IllegalOperationError;

    import net.idemax.lightmvc.control.Command;
    import net.idemax.lightmvc.model.Proxy;
    import net.idemax.lightmvc.view.Mediator;

    import org.osflash.signals.Signal;

    public class AbstractLightMVCComponent
    {
        private static var _globalSignal:Signal = new Signal( String, Object );

        private var _interestMap:Array;
        private var _mediatorsMap:Array;
        private var _commandsMap:Array;
        private var _proxiesMap:Array;

        public function AbstractLightMVCComponent( $this:AbstractLightMVCComponent )
        {
            if( this != $this )
            {
                throw new IllegalOperationError( 'Classe abstrata!' );

                return;
            }
            else
            {
                _interestMap = [];
                _mediatorsMap = [];
                _commandsMap = [];
                _proxiesMap = [];

                _globalSignal.add( globalSignalHandler );
            }
        }

        /**
         * Registra um interesse em alguma notificação.
         * O callback deve ter a assinatura:
         * function(Object)
         *
         * @param $notification
         * @param $callback
         *
         */
        public function registerInterest( $notification:String, $callback:Function = null ):void
        {
            _interestMap.push({ notification:$notification,
                                  callback:$callback }
                              );
        }

        /**
         * Desregistra um interesse numa notificação.
         *
         * @param $notification
         *
         */
        public function unregisterInterest( $notification:String ):void
        {
            var mapLenght:uint       = _interestMap.length;
            var newInterestMap:Array = [];

            var interest:Object;

            for( var i:uint = 0; i < mapLenght; i++ )
            {
                interest = _interestMap[ i ];

                if( interest.notification != $notification )
                    newInterestMap.push( interest );
            }

            _interestMap = newInterestMap;
        }

        /**
         *
         * Desregistra todos os interesses.
         *
         */
        public function unregisterAllInterests():void
        {
            _interestMap.length = 0;
        }

        /**
         * Dispara uma notificação para os interessados.
         *
         * @param $notification
         * @param $data
         *
         */
        public function dispatchInterest( $notification:String, $data:Object = null ):void
        {
            _globalSignal.dispatch( $notification, $data );
        }

        /**
         * Registra um mediator e relaciona ao seu componente visual.
         *
         * @param $mediator
         * @param $viewComponent
         *
         */
        public function registerMediator( $mediator:Class, $viewComponent:DisplayObject = null ):void
        {
            var mediator:Mediator = new $mediator( $viewComponent ) as Mediator;

            _mediatorsMap.push( mediator );

            mediator.registered();
        }

        /**
         * Desregistra um mediator.
         *
         * @param $mediator
         *
         */
        public function unregisterMediator( $mediator:Mediator ):void
        {
            $mediator.unregistered();

            var mapLenght:uint       = _mediatorsMap.length;
            var newMediatorMap:Array = []

            var mediator:Mediator;

            for( var i:uint = 0; i < mapLenght; i++ )
            {
                mediator = _mediatorsMap[ i ];

                if( mediator !== $mediator )
                    newMediatorMap.push( mediator );
            }

            _mediatorsMap = newMediatorMap;
        }

        /**
         * Registra um command.
         *
         * @param $command
         * @param $data
         *
         */
        public function registerCommand( $command:Class, $data:Object = null ):void
        {
            var command:Command = new $command( $data ) as Command;

            _commandsMap.push( command );

            command.registered();
        }

        /**
         * Desregistra um command.
         *
         * @param $command
         *
         */
        public function unregisterCommand( $command:Command ):void
        {
            $command.unregistered();

            var mapLenght:uint      = _commandsMap.length;
            var newCommandMap:Array = [];

            var command:Command;

            for( var i:uint = 0; i < mapLenght; i++ )
            {
                command = _commandsMap[ i ];

                if( command !== $command )
                    newCommandMap.push( command );
            }

            _commandsMap = newCommandMap;
        }

        /**
         * Registra um proxy.
         *
         * @param $proxy
         * @param $data
         *
         */
        public function registerProxy( $proxy:Class, $data:Object = null ):void
        {
            var proxy:Proxy = new $proxy( $data ) as Proxy;

            _commandsMap.push( proxy );

            proxy.registered();
        }

        /**
         * Desregistra um proxy.
         *
         * @param $proxy
         *
         */
        public function unregisterProxy( $proxy:Proxy ):void
        {
            $proxy.unregistered();

            var mapLenght:uint    = _proxiesMap.length;
            var newProxyMap:Array = [];

            var proxy:Proxy;

            for( var i:uint = 0; i < mapLenght; i++ )
            {
                proxy = _proxiesMap[ i ];

                if( proxy !== $proxy )
                    newProxyMap.push( proxy );
            }

            _proxiesMap = newProxyMap;
        }

        private function globalSignalHandler( $notification:String, $data:Object ):void
        {
            var interest:Object;
            var mapLenght:uint = _interestMap.length;

            for( var i:uint = 0; i < mapLenght; i++ )
            {
                interest = _interestMap[ i ];

                if( interest.notification == $notification )
                {
                    if( interest.callback != null )
                        interest.callback( $data );

                    break;
                }
            }
        }
    }
}