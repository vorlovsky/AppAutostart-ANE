package com.lj.ane.autostart
{
	import mx.core.mx_internal;
	
    import flash.external.ExtensionContext;    
    import flash.display.BitmapData;
	import flash.utils.ByteArray;
	import flash.events.StatusEvent;
	import flash.events.EventDispatcher;
	import flash.external.ExternalInterface;
    
    public class AppAutostartANE extends EventDispatcher
    {
        private static var _extensionContext:ExtensionContext = null;
		
        private static var _instance:AppAutostartANE = null;
		private static var _canInstantiate:Boolean = false;
				        
        public static function getInstance(): AppAutostartANE {
            
            if(_instance == null) {
				_canInstantiate = true;
                _instance = new AppAutostartANE();
				_canInstantiate = false;
            }
            
            return _instance;
        }
        
        public function AppAutostartANE()
        {
            if (!_canInstantiate) {
                throw new Error("Can't instantiate class directly!");
            }
			
			_extensionContext = ExtensionContext.createExtensionContext("com.lj.ane.autostart", "");
			_extensionContext.addEventListener(StatusEvent.STATUS, onStatus);
        }
        
        public function allow( status : Boolean ) : void
        {
			_extensionContext.call("allow", status);
        }
		
		private function onStatus( event : StatusEvent ) : void 
		{ 
 			event.stopImmediatePropagation();
			
			trace(event.code, event.level);
		}
    }
}