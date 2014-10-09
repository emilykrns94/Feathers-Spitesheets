package
{
	import feathers.controls.Panel
	import feathers.controls.Button
	import feathers.events.FeathersEventType;
	
	import starling.events.Event;
	import starling.utils.AssetManager;
	
	import flash.media.Sound;
	import flash.media.SoundChannel;

	public class Button extends Panel
	{
		private var theAssetsManager:AssetManager;

		public function Button()
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
			this.button.addEventListener(Event.TRIGGERED, buttonHandler);
			
			this.button1 = new Button ();
			this.button1.label = "Play Sound";
			button1.setAssetManager(assetMgr)
			this.addChild(this.button1);
			
			this.button.validate();
			this.button1.validate();
			
			this.button.x = (this.stage.stageWidth - this.button.width)/2;
			this.button1.x = (this.stage.stageWidth - this.button.width)/2;
			this.button.y = (this.stage.stageHeight - this.button.height)/2;
			this.button1.y = (this.stage.stageHeight - this.button.height)/2;
		}
		
		protected function buttonHandler(event:Event):void
		{
			bgImgLoader.source = atlas.getTexture("Sprite_2")
			theAssetManager.playSound("Thinking Out Loud");
		}

	}

}