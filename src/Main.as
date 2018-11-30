package {
	import feathers.utils.ScreenDensityScaleFactorManager;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.system.Capabilities;
	import flash.ui.Keyboard;
	
	import starling.core.Starling;
	
	[SWF(width="1024", height="768", frameRate="60", backgroundColor="#000000")]
	public class Main extends Sprite
	{
		private var scaler:ScreenDensityScaleFactorManager;
		private var starling:Starling;
		
		public function Main()
		{
			stage.color = 0xCCCCCC;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
			
			loaderInfo.addEventListener(Event.COMPLETE, loaderInfo_completeHandler);
		}
		
		private function setupStarling():void
		{
			Starling.multitouchEnabled = true;
			
			starling = new Starling(StarlingRoot, this.stage);
			starling.supportHighResolutions = true;
			starling.simulateMultitouch = Capabilities.isDebugger;
			starling.skipUnchangedFrames = true;
			starling.start();
			
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onKeyUp(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.ENTER)
			{
				Starling.current.context.dispose();
			}
		}
		
		private function loaderInfo_completeHandler(event:Event):void
		{
			setupStarling();
			
			scaler = new ScreenDensityScaleFactorManager(starling);
		}
	}
}
