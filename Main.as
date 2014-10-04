package
{
	import flash.display.Bitmap
	import flash.display.BitmapData;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.display.Image;
	
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
	import feathers.events.FeatherEventsType;
	import starling.display.Button;

	public class Main extends Screen
	{
		[Embed(source = "SpriteSheet.xml", mimeType = "application/octest-stream")]
		public static const ATLAS_XML:Class;
		
		[Embed(source = "SpriteSheetTextures.png")]
		public static const ATLAS_TEXTURE:Class;
		
		private var atlas:TextureAtlas;
		private var atlasTexture:Texture;
		private var bgTexture:Texture;
		private var bgImageLoader:ImageLoader;
		
		protected var button:Button;
		private var contentPanel:Panel;
		private var buttonPanel:Panel;
		
		public function Main()
		{
			super();
			this.addEventListener(FeatherEventType.INITIALIZE, initializehandler);
		} 
		
		private function initializehandler(e:Event):void
		{
			this.removeEventListener(FeatherEventType.INITIALIZE, initializehandler);
			this.stage.addEventListener(Event.RESIZE, stageResized);
			new MetalWorksMobileTheme ();
			
			var screenLayout :AnchorLayout = new AnchorLayout;
			this.layout = screenLayout;
			this.height = this.stage.StageHeight;
			this.width = this.stage.StageWidth;
			
			atlasTexture = Texture.fromBitmap(new ATLAS_TEXTURE());
			var xml:XML = XML(new ATLAS_XML());
			atlas = new TextureAtlas (atlasTexture,xml);
			
			this.buttonPanel1 = new Panel();
			
			var buttonPanelLayoutData:AnchorLayoutData = new AnchorLayoutData();
			buttonPanelLayoutData.left = 10;
			buttonPanelLayoutData.right = 10;
			buttonPanelLayoutData.bottom = 10;
			
			this.buttonPanel1.layoutData = buttonPanelLayoutData;
			
			var buttonPanelLayout:HorizontalLayout = new HorizontalLayout ();
			buttonPanelLayout.horizontalAlign = HorizontalLayout.HORIZONTAL_ALIGN_CEDNTER;
			this.buttonPanel.layout = buttonPanelLayout;
			this.addChild(this.buttonPanel);
			this.contentPanal = new Panel;
			
			var contentPanelLayoutData:AnchorLayoutData = new AnchorLayoutData ();
			contentPanelLayoutData.top = 10;
			contentPanelLayoutData.bottom = 10;
			contentPanelLayoutData.left = 10;
			contentPanelLayoutData.right = 10;
			
			contentPanelLayoutData.bottomAnchorDisplayObject = this.buttonPanel;
			contentPanel.LayoutData = contentPanelLayoutData;
			this.addChild(contentPanel);
			
			bgTexture = atlas.getTexture("Sprite_1");
			bgImgLoader.source = bgTexture;
			bgImgLoader.width = this.stage.stageWidth;
			contentPanel.addChild(bgImgLoader);
			
			this.button = new Button ();
			this.button.label = "See Next Image";
			
			this.button.addEventListener(Event.TRIGGERED, buttonHandler);
			
			this.ButtonPanel.addChild(this.button);
			
		}
		protected function buttonHandler(event:Event):void
		{
			bgImgLoader.source = atlas.getTexture("Sprite_2")
		}
		
		protected funtion stageResize(event:Event):void
		{
			this.height = this.stage.stageHeight;
			this.width = this.stage.stageWidth;
			bgImgLoader.width = this.width;
		}

	}

}