package
{
	import feathers.controls.Panel;
	import feathers.controls.Button;
	import feathers.events.FeathersEventType;
	
	import starling.events.Event;
	import starling.utils.AssetManager;
	
	
	import flash.media.Sound;
	import flash.media.SoundChannel;

	public class TabA extends Panel
	{
		protected var button:Button;
		private var theAssetManager:AssetManager;

		public function TabA()
		{
			super();
			this.addEventListener(FeathersEventType.INITIALIZE, initializeButton);
		}
		
		public function setAssetManager(am:AssetManager):void
		{
			if(am is AssetManager)
			{
				this.theAssetManager = am;
			}
		}
		
		private function initializeButton(e:Event):void
		{
			this.button = new Button ();
			this.button.label = "See Next Image";
			this.addChild(this.button);
			
			this.button = new Button ();
			this.button.label = "Play Sound";
			this.addChild(this.button);
			this.button.addEventListener(Event.TRIGGERED, music_buttonHandler);
			
			this.button.validate();
			
			this.button.x = (this.stage.stageWidth - this.button.width)/2;
			this.button.y = (this.stage.stageHeight - this.button.height)/2;

		}
		
		protected function music_buttonHandler(event:Event):void
		{
			theAssetManager.playSound("Thinking Out Loud");
		}

	}

}