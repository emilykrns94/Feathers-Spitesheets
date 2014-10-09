package
{
	import flash.display.Bitmap
	import flash.display.BitmapData;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.display.Image;
	import starling.utils.AssetManager;
	import starling.display.Button;
	
	import feathers.controls.Button;
	import feathers.controls.Screen;
	import feathers.controls.Panel;
	import feathers.controls.ImageLoader;
	import feathers.controls.TabBar;
	import feathers.layout.VerticalLayout;
	import feathers.layout.VerticalLayoutData;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.themes.MetalWorksMobileTheme;
	import feathers.events.FeathersEventType;
	import feathers.data.ListCollection;
	import feathers.motion.transitions.ScreenFadeTransitionManager;
	import flash.text.engine.TabAlignment;

	public class Main extends Screen
	{
		[Embed(source = "SpriteSheet/Spritesheet.xml", mimeType = "application/octet-stream")]
		public static const ATLAS_XML:Class;
		
		[Embed(source = "SpriteSheet/SpriteSheetTextures.png")]
		public static const ATLAS_TEXTURE:Class;
		
		private var atlas:TextureAtlas;
		private var atlasTexture:Texture;
		private var bgTexture:Texture;
		private var bgImgLoader:ImageLoader;
		
		private var contentPanel:Panel;
		private var buttonPanel:Panel;
		
		private var assetMgr:AssetManager;
		
		protected var button:Button;
		
		private var theAssetManager:AssetManager;

		public function Main()
		{
			super();
			this.addEventListener(FeathersEventType.INITIALIZE, initialize);
		} 
		
		private function initializeHandler(e:Event):void
		{
			assetMgr = new AssetManager();
			assetMgr.verbose = true;
			assetMgr.enqueue(EmbeddedAssets);
			assetMgr.loadQueue(handleAssetsLoading);
		}
		
		private function handleAssetsLoading(ratioLoaded:Number):void
		{
			trace("handleAssetsLoading: " + ratioLoaded);
			if (ratioLoaded == 1)
			{
				startApp()
			}
		}
		
		private function startApp()
		{
			this.stage.addEventListener(Event.RESIZE, stageResized);
			new MetalWorksMobileTheme ();
			
			var screenLayout:AnchorLayout = new AnchorLayout;
			this.layout = screenLayout;
			this.height = this.stage.stageHeight;
			this.width = this.stage.stageWidth;
			
			atlasTexture = Texture.fromBitmap(new ATLAS_TEXTURE());
			var xml:XML = XML(new ATLAS_XML());
			atlas = new TextureAtlas (atlasTexture,xml);
				
			
			var buttonPanelLayoutData:AnchorLayoutData = new AnchorLayoutData();
			buttonPanelLayoutData.left = 10;
			buttonPanelLayoutData.right = 10;
			buttonPanelLayoutData.bottom = 10;
			
			this.buttonPanel.layoutData = buttonPanelLayoutData;
			
			var buttonPanelLayout:HorizontalLayout = new HorizontalLayout ();
			buttonPanelLayout.horizontalAlign = HorizontalLayout.HORIZONTAL_ALIGN_CENTER;
			this.buttonPanel.layout = buttonPanelLayout;
			this.addChild(this.buttonPanel);
			
			this.contentPanel = new Panel;
			
			var contentPanelLayoutData:AnchorLayoutData = new AnchorLayoutData ();
			contentPanelLayoutData.top = 10;
			contentPanelLayoutData.bottom = 10;
			contentPanelLayoutData.left = 10;
			contentPanelLayoutData.right = 10;
				
			contentPanel.layoutData = contentPanelLayoutData;
			this.addChild(contentPanel);
			
			bgTexture = atlas.getTexture("Sprite_1");
			bgImgLoader = new ImageLoader();
			bgImgLoader.source = bgTexture;
			bgImgLoader.width = this.stage.stageWidth;
			contentPanel.addChild(bgImgLoader);
			
			this.button = new Button ();
			this.button.label = "See Next Image";
			this.buttonPanel.addChild(this.button);
			this.button.addEventListener(Event.TRIGGERED, image_buttonHandler);
			
			this.button = new Button ();
			this.button.label ="Play Sound";
			this.buttonPanel.addChild(this.button);
			this.button.addEventListener(Event.TRIGGERED, music_buttonHandler);
		}
	
		protected function stageResized(event:Event):void
		{
			this.height = this.stage.stageHeight;
			this.width = this.stage.stageWidth;
			bgImgLoader.width = this.width;
		}
		
		protected function image_buttonHandler(event:Event):void
		{
			bgImgLoader.source = atlas.getTexture("Sprite_2")
		}
		
		protected function music_buttonHandler(event:Event):void
		{
			assetMgr.playSound("Thinking Out Loud");
		}

	}

}