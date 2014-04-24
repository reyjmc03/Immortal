package 
{
    import __AS3__.vec.*;
    import com.greensock.*;
    import com.greensock.easing.*;
    import flash.display.*;
    import flash.events.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.ui.*;

    public class Tower extends MovieClip
    {
        public var btArrowUp:MovieClip;
        public var podvalLight:MovieClip;
        public var twr:MovieClip;
        private var cells:Array;
        public var cannons:Vector.<Cannon>;
        public var floorsCount:int = 2;
        public const TOTAL_FLOORS:int = 5;
        public const X_OFFSET:Number = -90;
        public const Y_OFFSET:Number = -61;
        private var cannonsContainer:Sprite;
        private var level:Level;
        private var mouseRow:int = -1;
        private var mouseCol:int = -1;
        private var mouseDownPos:Point;
        private var smokeTime:Number = 2000;
        public var eyeActivity:String = "normal";
        private var eyeState:int = 0;
        private var eyeShootFame:int = 130;
        private var eyeMc:MovieClip;
        public var eyeRay:EyeRayRastr;
        private var btEyeSrike:MovieClip;
        private var eyeAddCounter:Number = 0;
        private var eyeAddTime:Number = 60000;
        private var eyeActiveTime:Number = 8000;
        private var eyeActiveCounter:Number = 0;
        private var floors:Vector.<MovieClip>;
        private var tube1:RastrMovieClip2;
        private var tube2:RastrMovieClip2;
        private var tube3:RastrMovieClip2;
        private var tube4:RastrMovieClip2;
        private var tube5:RastrMovieClip2;
        private var tube1Count:int = 0;
        private var tube2Count:int = 0;
        private var tube3Count:int = 0;
        private var tube4Count:int = 0;
        private var tube5Count:int = 0;
        private var btTube1:Sprite;
        private var btTube2:Sprite;
        private var btTube3:Sprite;
        private var btTube4:Sprite;
        private var btTube5:Sprite;
        private var headGear:RastrMovieClip2;
        private var floorGear:RastrMovieClip2;
        private var btHeadGear:Sprite;
        private var btFloorGear:Sprite;
        private var headGearTime:Number = 0;
        private var floorGearTime:Number = 0;
        private var headGearCounter:Number;
        private var floorGearCounter:Number;
        public var isAnimating:Boolean = false;
        private var isMouseDown:Boolean = false;
        public var dragBlock:Cannon;
        private var downCol:int = -1;
        private var downRow:int = -1;
        private var downCellChanged:Boolean = false;
        private var moveDir:Point;
        private var showInfoCannon:Cannon;
        private var glowCannonDrag:Array;
        private var glowCannonPodval:Array;
        private var glowCannonSelect:Array;
        private var restoreUpgrades:Boolean;
        private var eyeSound:DGSound;
        private var prevDate:Date;
        private var u_wid:int = 2.14748e+009;
        private var drry:int;
        private var drrx:int;
        private var rrrangle:Number;
        private var lentth:int;
        private var ricoshetCount:int = 0;
        private var area1:Rectangle;
        private var area2:Rectangle;
        private var area3:Rectangle;

        public function Tower()
        {
            this.cells = new Array();
            this.cannons = new Vector.<Cannon>;
            this.cannonsContainer = new Sprite();
            this.mouseDownPos = new Point();
            this.floors = new Vector.<MovieClip>;
            this.headGearCounter = Utilites.randomNumber(3000, 5000);
            this.floorGearCounter = Utilites.randomNumber(5000, 8000);
            this.moveDir = new Point();
            this.glowCannonDrag = [new GlowFilter(16777215, 0.5, 5, 5)];
            this.glowCannonPodval = [new GlowFilter(16777215, 0.5, 5, 5)];
            this.glowCannonSelect = [new GlowFilter(16776960, 0.3, 5, 5)];
            this.prevDate = new Date();
            this.area1 = new Rectangle();
            this.area2 = new Rectangle();
            this.area3 = new Rectangle();
            return;
        }// end function

        public function initialize(param1:Level) : void
        {
            var _loc_4:Array = null;
            var _loc_5:int = 0;
            var _loc_6:Cell = null;
            SoundManager.playOnce("snd_yessir", 0);
            this.level = param1;
            var _loc_2:int = 0;
            while (_loc_2 <= this.TOTAL_FLOORS)
            {
                
                _loc_4 = new Array();
                this.cells.push(_loc_4);
                _loc_5 = 0;
                while (_loc_5 < 3)
                {
                    
                    _loc_6 = new Cell(this);
                    _loc_6.pos.x = this.X_OFFSET + _loc_5 * Cell.WIDTH;
                    _loc_6.pos.y = this.Y_OFFSET - _loc_2 * Cell.HEIGHT;
                    _loc_6.row = _loc_2;
                    _loc_6.col = _loc_5;
                    _loc_4.push(_loc_6);
                    _loc_5++;
                }
                _loc_2++;
            }
            this.setUpCells();
            addChild(this.cannonsContainer);
            param1.stage.addEventListener(MouseEvent.MOUSE_UP, this.mouseUpHandler, false, 0, true);
            param1.stage.addEventListener(MouseEvent.CLICK, this.stageClick, false, 0, true);
            param1.stage.addEventListener(MouseEvent.MOUSE_MOVE, this.moveTarget, false, 0, true);
            this.btArrowUp.buttonMode = true;
            this.btArrowUp.addEventListener(MouseEvent.CLICK, this.showBuyMenu, false, 0, true);
            this.btEyeSrike = this.twr.container.head.btEyeSrike;
            this.eyeRay = new EyeRayRastr();
            this.eyeRay.initialize();
            var _loc_3:* = param1.getChildIndex(param1.eyeEff);
            param1.addChildAt(this.eyeRay, _loc_3);
            this.eyeRay.visible = false;
            param1.eyeEff.visible = false;
            this.eyeMc = this.twr.container.head.eye;
            this.eyeMc.stop();
            this.eyeAddCounter = 0;
            if (this.twr.container.head.eye)
            {
                this.twr.container.head.eye.stop();
            }
            stage.addEventListener(MouseEvent.MOUSE_DOWN, this.blockMouseDown, false, 0, true);
            this.btEyeSrike.visible = false;
            this.btEyeSrike.buttonMode = true;
            this.btEyeSrike.addEventListener(MouseEvent.CLICK, this.btEyeSrikeClick, false, 0, true);
            this.initializeTrubes();
            this.floors.push(this.twr.container.floor1, this.twr.container.floor2, this.twr.container.floor3, this.twr.container.floor4, this.twr.container.floor5);
            return;
        }// end function

        private function moveTarget(event:MouseEvent) : void
        {
            if (this.eyeState == 2)
            {
            }
            return;
        }// end function

        private function initializeTrubes() : void
        {
            this.tube1 = this.processHeadMc(this.twr.container.head.tube1);
            this.tube2 = this.processHeadMc(this.twr.container.head.tube2);
            this.tube3 = this.processHeadMc(this.twr.container.head.tube3);
            this.tube4 = this.processHeadMc(this.twr.container.head.tube4);
            this.tube5 = this.processHeadMc(this.twr.container.head.tube5);
            this.btTube1 = this.twr.container.head.btTube1;
            this.btTube2 = this.twr.container.head.btTube2;
            this.btTube3 = this.twr.container.head.btTube3;
            this.btTube4 = this.twr.container.head.btTube4;
            this.btTube5 = this.twr.container.head.btTube5;
            this.btTube1.addEventListener(MouseEvent.CLICK, this.tubeSmoke, false, 0, true);
            this.btTube2.addEventListener(MouseEvent.CLICK, this.tubeSmoke, false, 0, true);
            this.btTube3.addEventListener(MouseEvent.CLICK, this.tubeSmoke, false, 0, true);
            this.btTube4.addEventListener(MouseEvent.CLICK, this.tubeSmoke, false, 0, true);
            this.btTube5.addEventListener(MouseEvent.CLICK, this.tubeSmoke, false, 0, true);
            this.headGear = this.processHeadMc(this.twr.container.head.gear);
            this.floorGear = this.processHeadMc(this.twr.basement.gear);
            this.headGear.stop();
            this.floorGear.stop();
            this.btHeadGear = this.twr.container.head.btGear;
            this.btFloorGear = this.twr.basement.btGear;
            this.btHeadGear.addEventListener(MouseEvent.CLICK, this.addHeadGearTime, false, 0, true);
            this.btFloorGear.addEventListener(MouseEvent.CLICK, this.addFloorGearTime, false, 0, true);
            return;
        }// end function

        private function addHeadGearTime(event:MouseEvent) : void
        {
            if (this.headGearTime < 5000)
            {
                this.headGearTime = this.headGearTime + Utilites.randomNumber(1000, 2000);
            }
            return;
        }// end function

        private function addFloorGearTime(event:MouseEvent) : void
        {
            if (this.floorGearTime < 5000)
            {
                this.floorGearTime = this.floorGearTime + Utilites.randomNumber(1000, 2000);
            }
            return;
        }// end function

        private function processHeadMc(param1:MovieClip) : RastrMovieClip2
        {
            var _loc_2:* = new RastrMovieClip2();
            _loc_2.initialize(param1);
            _loc_2.stop();
            var _loc_3:* = param1.parent.getChildIndex(param1);
            param1.parent.addChildAt(_loc_2.rastrCostume, _loc_3);
            param1.parent.removeChild(param1);
            param1.stop();
            return _loc_2;
        }// end function

        private function tubeSmoke(event:MouseEvent) : void
        {
            if (event.target == this.btTube1 && this.tube1Count < 3)
            {
                var _loc_2:String = this;
                var _loc_3:* = this.tube1Count + 1;
                _loc_2.tube1Count = _loc_3;
            }
            else if (event.target == this.btTube2 && this.tube2Count < 3)
            {
                var _loc_2:String = this;
                var _loc_3:* = this.tube2Count + 1;
                _loc_2.tube2Count = _loc_3;
            }
            else if (event.target == this.btTube3 && this.tube3Count < 3)
            {
                var _loc_2:String = this;
                var _loc_3:* = this.tube3Count + 1;
                _loc_2.tube3Count = _loc_3;
            }
            else if (event.target == this.btTube4 && this.tube4Count < 3)
            {
                var _loc_2:String = this;
                var _loc_3:* = this.tube4Count + 1;
                _loc_2.tube4Count = _loc_3;
            }
            else if (event.target == this.btTube5 && this.tube5Count < 3)
            {
                var _loc_2:String = this;
                var _loc_3:* = this.tube5Count + 1;
                _loc_2.tube5Count = _loc_3;
            }
            return;
        }// end function

        public function reset() : void
        {
            this.twr.container.head.allHints.visible = false;
            this.twr.container.head.allHints.mcHint.gotoAndStop(8);
            this.twr.container.head.antena.gotoAndStop(1);
            this.eyeRay.visible = false;
            this.level.eyeEff.visible = false;
            this.eyeMc.gotoAndStop(1);
            this.eyeAddCounter = 0;
            this.eyeState = 0;
            this.level.agButton_btn.alpha = 1;
            this.level.eyeBarPanel.visible = false;
            this.btEyeSrike.visible = false;
            this.btArrowUp.visible = true;
            this.btArrowUp.alpha = 1;
            this.setFloorsCount(2);
            this.level.bottomMenu.hideAll();
            this.level.bottomMenuUpgr.hideAll();
            this.hideLift(0);
            var _loc_1:* = this.cannons.length - 1;
            while (_loc_1 >= 0)
            {
                
                this.removeCannon(this.cannons[_loc_1]);
                _loc_1 = _loc_1 - 1;
            }
            return;
        }// end function

        public function cannonsCount() : int
        {
            return this.cannons.length;
        }// end function

        public function setFloorsCount(param1:int) : void
        {
            var _loc_3:int = 0;
            var _loc_4:MovieClip = null;
            this.twr.container.gotoAndStop("level" + param1);
            this.floorsCount = param1;
            this.setUpCells();
            var _loc_2:int = 0;
            while (_loc_2 < this.floors.length)
            {
                
                this.floors[_loc_2].gotoAndStop(1);
                if (_loc_2 < this.floorsCount)
                {
                    this.floors[_loc_2].visible = true;
                }
                _loc_3 = 1;
                while (_loc_3 <= 5)
                {
                    
                    _loc_4 = this.floors[_loc_2].getChildByName("destr" + _loc_3) as MovieClip;
                    _loc_4.visible = false;
                    _loc_4.gotoAndStop(1);
                    _loc_3++;
                }
                _loc_2++;
            }
            return;
        }// end function

        private function showBuyMenu(event:MouseEvent) : void
        {
            if (Level.levelIndex == 0 && HintPanels.cannonBuyClick == false && !this.level.levelManager.isChallenge)
            {
                HintPanels.cannonBuyClick = true;
                return;
            }
            if (this.level.state == GameState.GAME && event.target.enabled && !this.isEyeActive() && this.cannons.length < this.level.levelManager.maxCannonsCount)
            {
                SoundManager.playOnce("window_5.wav", 0.3);
                this.level.bottomMenu.showBuyButtons();
            }
            return;
        }// end function

        public function growUp(param1:Boolean = false) : void
        {
            if (this.floorsCount < this.TOTAL_FLOORS && (this.floorsCount < this.level.levelManager.maxFloorsCount || param1))
            {
                var _loc_2:String = this;
                var _loc_3:* = this.floorsCount + 1;
                _loc_2.floorsCount = _loc_3;
                this.twr.container.play();
                this.headGearTime = Utilites.randomNumber(1500, 2000);
                this.floorGearTime = Utilites.randomNumber(1500, 2000);
                TweenNano.delayedCall(1, this.setUpCells);
                this.level.shake(1, 1100);
                this.tube1Count = this.tube1Count + 2;
                this.tube2Count = this.tube2Count + 2;
                this.tube3Count = this.tube3Count + 2;
                this.tube4Count = this.tube4Count + 2;
                this.tube5Count = this.tube5Count + 2;
                this.headGearCounter = this.headGearCounter + 2000;
                this.floorGearCounter = this.floorGearCounter + 2000;
                SoundManager.playOnce("snd_tower_up", 1);
            }
            return;
        }// end function

        private function setUpCells() : void
        {
            var _loc_1:int = 0;
            while (_loc_1 <= this.floorsCount)
            {
                
                this.cells[_loc_1][0].connectRight = _loc_1 > 0;
                this.cells[_loc_1][2].connectLeft = _loc_1 > 0;
                this.cells[_loc_1][1].connectUp = _loc_1 < this.floorsCount;
                this.cells[_loc_1][1].connectRight = _loc_1 > 0;
                this.cells[_loc_1][1].connectDown = _loc_1 > 0;
                this.cells[_loc_1][1].connectLeft = _loc_1 > 0;
                _loc_1++;
            }
            return;
        }// end function

        public function addCannon(param1:int, param2:int, param3:Cannon) : void
        {
            var r:* = param1;
            var c:* = param2;
            var cannon:* = param3;
            if (cannon is CannonMachineGun)
            {
                Achivements.machBuyed = true;
            }
            if (cannon is CannonHeavyGun)
            {
                Achivements.heavyBuyed = true;
            }
            if (cannon is CannonSawGun)
            {
                Achivements.sawsBuyed = true;
            }
            if (cannon is CannonElectroGun)
            {
                Achivements.lightBuyed = true;
            }
            this.cannons.push(cannon);
            this.cannonsContainer.addChild(cannon);
            cannon.cell = this.cells[r][c];
            cannon.cell.state = 1;
            cannon.x = cannon.cell.pos.x;
            cannon.y = cannon.cell.pos.y;
            cannon.initialize(this.level);
            cannon.update();
            cannon.addEventListener(MouseEvent.CLICK, this.blockClick, false, 0, true);
            if (cannon.cell.col == 1 && cannon.cell.row == 0)
            {
                var finishAnim:* = function () : void
            {
                isAnimating = false;
                if (cannons.length >= floorsCount * 2)
                {
                    growUp();
                }
                HintPanels.cannonBuyed = true;
                return;
            }// end function
            ;
                TweenNano.to(this.btArrowUp, 0.5, {alpha:0});
                cannon.y = cannon.y + Cell.HEIGHT;
                TweenNano.to(cannon, 0.5, {y:cannon.cell.pos.y, onComplete:finishAnim});
                this.showLift(0.5, true);
                this.lightUpPodvalBlock(cannon);
                this.addPar();
                SoundManager.playOnce("snd_steam1", 0.5);
            }
            if (this.cannons.length >= this.level.levelManager.maxCannonsCount)
            {
                this.btArrowUp.visible = false;
            }
            return;
        }// end function

        public function removeCannon(param1:Cannon) : void
        {
            var c:* = param1;
            this.cannons.splice(this.cannons.indexOf(c), 1);
            c.cell.state = 0;
            if (c.isPodval)
            {
                var removeMC:* = function () : void
            {
                c.parent.removeChild(c);
                c.dispose();
                return;
            }// end function
            ;
                c.isPodval = false;
                TweenNano.to(c, 1.2, {y:c.y + 100, onComplete:removeMC});
                this.hideLift();
                this.addPar();
                this.podvalLight.play();
                SoundManager.playOnce("snd_steam1", 0.5);
                SoundManager.playOnce("buying_1.wav", 1);
            }
            else
            {
                c.dispose();
            }
            if (this.cannons.length < this.level.levelManager.maxCannonsCount)
            {
                this.btArrowUp.visible = true;
            }
            c.removeEventListener(MouseEvent.CLICK, this.blockClick);
            return;
        }// end function

        private function mouseUpHandler(event:MouseEvent = null) : void
        {
            var _loc_2:Cannon = null;
            var _loc_3:MovieClip = null;
            this.isMouseDown = false;
            if (this.dragBlock)
            {
                if (this.dragBlock != this.showInfoCannon)
                {
                    if (!(this.dragBlock.cell.col == 1 && this.dragBlock.cell.row == 0))
                    {
                        this.dragBlock.mcCannon.filters = null;
                    }
                    else
                    {
                        this.lightUpPodvalBlock(this.dragBlock);
                    }
                }
                _loc_2 = this.dragBlock;
                this.dragBlock = null;
                _loc_3 = _loc_2.bg;
                if (!_loc_3.hitTestPoint(stage.mouseX, stage.mouseY))
                {
                    _loc_2.hideStateInfo();
                }
            }
            return;
        }// end function

        private function lightUpPodvalBlock(param1:Cannon) : void
        {
            param1.mcCannon.filters = this.glowCannonPodval;
            return;
        }// end function

        private function blockMouseDown(event:MouseEvent) : void
        {
            var _loc_2:Cannon = null;
            this.mouseDownPos.x = stage.mouseX;
            this.mouseDownPos.y = stage.mouseY;
            if (this.cellExists(this.mouseRow, this.mouseCol) && !this.isEyeActive())
            {
                _loc_2 = this.getCannonByCell(this.mouseRow, this.mouseCol);
                if (_loc_2)
                {
                    this.isMouseDown = true;
                    this.dragBlock = _loc_2;
                    if (this.dragBlock != this.showInfoCannon)
                    {
                        this.dragBlock.mcCannon.filters = this.glowCannonDrag;
                    }
                    this.cells[this.mouseRow][this.mouseCol].state = 1;
                    this.downCol = this.mouseCol;
                    this.downRow = this.mouseRow;
                    this.downCellChanged = false;
                }
            }
            return;
        }// end function

        private function getCannonByCell(param1:int, param2:int) : Cannon
        {
            var _loc_4:Cannon = null;
            var _loc_3:int = 0;
            while (_loc_3 < this.cannons.length)
            {
                
                _loc_4 = this.cannons[_loc_3];
                if (_loc_4.cell.col == param2 && _loc_4.cell.row == param1)
                {
                    return _loc_4;
                }
                _loc_3++;
            }
            return null;
        }// end function

        public function getPodvalCannon() : Cannon
        {
            var _loc_1:int = 0;
            while (_loc_1 < this.cannons.length)
            {
                
                if (this.cannons[_loc_1].isPodval)
                {
                    return this.cannons[_loc_1];
                }
                _loc_1++;
            }
            return null;
        }// end function

        private function blockClick(event:MouseEvent) : void
        {
            if (this.cellExists(this.mouseRow, this.mouseCol) && !this.downCellChanged && stage.mouseX == this.mouseDownPos.x && stage.mouseY == this.mouseDownPos.y)
            {
                this.hideBlockSelection();
                this.showInfoCannon = event.target as Cannon;
                this.level.showCannonInfo(this.showInfoCannon);
                this.showInfoCannon.mcCannon.filters = this.glowCannonSelect;
                this.level.mcCannonDistanceLeft.visible = true;
                this.level.mcCannonDistanceRight.visible = true;
                this.level.mcCannonDistanceLeft.x = -this.showInfoCannon.distance - Cell.WIDTH * 1.5;
                this.level.mcCannonDistanceRight.x = this.showInfoCannon.distance + Cell.WIDTH * 1.5;
            }
            return;
        }// end function

        private function hideBlockSelection() : void
        {
            if (this.showInfoCannon)
            {
                if (!(this.showInfoCannon.cell.col == 1 && this.showInfoCannon.cell.row == 0))
                {
                    this.showInfoCannon.mcCannon.filters = null;
                }
                else
                {
                    this.lightUpPodvalBlock(this.showInfoCannon);
                }
                this.level.mcCannonDistanceLeft.visible = false;
                this.level.mcCannonDistanceRight.visible = false;
                this.showInfoCannon = null;
                this.level.showCannonInfo(null);
            }
            return;
        }// end function

        private function stageClick(event:MouseEvent) : void
        {
            if (!(event.target is Cannon) || event.target != this.showInfoCannon && !this.downCellChanged)
            {
                this.hideBlockSelection();
            }
            return;
        }// end function

        public function update() : void
        {
            var _loc_2:int = 0;
            var _loc_3:int = 0;
            var _loc_4:Point = null;
            this.mouseCol = Math.floor((this.cannonsContainer.mouseX - this.X_OFFSET) / Cell.WIDTH);
            this.mouseRow = Math.floor((this.Y_OFFSET - this.cannonsContainer.mouseY) / Cell.HEIGHT) + 1;
            if (this.mouseCol == -1)
            {
                this.mouseCol = 0;
            }
            if (this.mouseCol == 3)
            {
                this.mouseCol = 2;
            }
            if (this.downCol != this.mouseCol || this.downRow != this.mouseRow)
            {
                this.downCellChanged = true;
            }
            if (this.isMouseDown)
            {
                _loc_2 = this.dragBlock.cell.col;
                _loc_3 = this.dragBlock.cell.row;
                if (this.dragBlock && (this.mouseRow != _loc_3 || this.mouseCol != _loc_2) && !(_loc_2 == 1 && _loc_3 == 0 && this.isAnimating))
                {
                    _loc_4 = new Point(this.dragBlock.cell.col - this.mouseCol, this.dragBlock.cell.row - this.mouseRow);
                    if (this.dragBlock.animDir.x == 0 && this.dragBlock.animDir.y == 0 || _loc_4.x == this.dragBlock.animDir.x && _loc_4.y == this.dragBlock.animDir.y)
                    {
                        if (this.isCellsConnectsLine(_loc_3, _loc_2, this.mouseRow, this.mouseCol) && this.cells[this.mouseRow][this.mouseCol].state == 0)
                        {
                            this.moveBlockToCell(this.dragBlock, this.mouseRow, this.mouseCol);
                        }
                    }
                }
            }
            var _loc_1:int = 0;
            while (_loc_1 < this.cannons.length)
            {
                
                this.cannons[_loc_1].update();
                _loc_1++;
            }
            if (this.level.money >= CannonMachineGun.price || this.level.money >= CannonHeavyGun.price || this.level.money >= CannonElectroGun.price || this.level.money >= CannonSawGun.price)
            {
                if (this.btArrowUp.currentFrame == 3)
                {
                    this.btArrowUp.gotoAndStop(1);
                }
                if (this.btArrowUp.currentFrame == 4)
                {
                    this.btArrowUp.gotoAndStop(2);
                }
            }
            else if (this.btArrowUp.currentFrame < 3)
            {
                this.btArrowUp.gotoAndStop(3);
            }
            this.updateAnimation();
            this.updateEye();
            this.updateDistruction();
            return;
        }// end function

        private function updateDistruction() : void
        {
            var _loc_6:int = 0;
            var _loc_7:MovieClip = null;
            var _loc_8:MovieClip = null;
            var _loc_9:MovieClip = null;
            var _loc_10:AutoRemoveObject = null;
            var _loc_1:* = this.floorsCount * 5;
            var _loc_2:int = 1;
            var _loc_3:int = 0;
            while (_loc_3 < this.floors.length)
            {
                
                _loc_2 = _loc_2 + (this.floors[_loc_3].currentFrame - 1);
                _loc_3++;
            }
            var _loc_4:* = 1 - _loc_2 / _loc_1;
            var _loc_5:* = this.level.health / Level.maxHealth;
            if (_loc_4 > _loc_5)
            {
                _loc_6 = Utilites.randomInt(0, (this.floorsCount - 1));
                _loc_3 = 0;
                while (_loc_3 < this.floorsCount)
                {
                    
                    if (this.floors[_loc_3].currentFrame < this.floors[_loc_6].currentFrame)
                    {
                        _loc_6 = _loc_3;
                    }
                    _loc_3++;
                }
                _loc_7 = this.floors[_loc_6];
                _loc_8 = _loc_7.getChildByName("destr" + _loc_7.currentFrame) as MovieClip;
                _loc_8.visible = true;
                _loc_8.gotoAndPlay(1);
                _loc_7.gotoAndStop((_loc_7.currentFrame + 1));
                _loc_9 = new Ricoshet3();
                _loc_9.x = _loc_8.x;
                _loc_9.y = _loc_8.y;
                _loc_10 = new AutoRemoveObject(_loc_9);
                _loc_7.addChild(_loc_9);
                this.level.shake(0.5, 200);
                if (SoundManager.getCount("snd_exp_small") < 3)
                {
                    SoundManager.playOnce("snd_exp_small", 0.3);
                }
            }
            return;
        }// end function

        private function btEyeSrikeClick(event:MouseEvent) : void
        {
            var _loc_2:MovieClip = null;
            if (this.eyeState == 4 && this.level.state == GameState.GAME)
            {
                this.eyeState = 1;
                SoundManager.playOnce("eye_opening_4.wav", 0.5);
                Achivements.eyeActive = true;
                this.level.bottomMenu.hideAll();
                this.restoreUpgrades = this.level.bottomMenuUpgr.state == 2;
                this.level.bottomMenuUpgr.hideAll();
                TweenNano.to(this.btEyeSrike, 0.3, {alpha:0, onComplete:Utilites.hideObject, onCompleteParams:[this.btEyeSrike]});
                this.level.cannonInfoPanel.visible = false;
                this.level.unitInfoPanel.visible = false;
                if (Level.levelIndex == 2 && this.twr.container.head.allHints.visible)
                {
                    _loc_2 = this.twr.container.head.allHints;
                    TweenNano.to(_loc_2, 1, {alpha:0, onComplete:Utilites.hideObject, onCompleteParams:[_loc_2]});
                    this.level.helps.showHint(15);
                }
            }
            return;
        }// end function

        public function stopEyeSound() : void
        {
            if (this.eyeSound)
            {
                this.eyeSound.stop();
                this.eyeSound = null;
            }
            return;
        }// end function

        private function updateEye() : void
        {
            var frm:int;
            var hints:MovieClip;
            var p:Point;
            var dx:Number;
            var dy:Number;
            var length:Number;
            var dr:Number;
            var pr:Number;
            var p2:Point;
            var b:BulletEye;
            var c:Cannon;
            if (this.eyeActivity == "always")
            {
                if (this.eyeState == 0)
                {
                    this.eyeAddCounter = this.eyeAddTime;
                }
            }
            if (this.level.state == GameState.GAME && this.level.levelManager.gameStarted)
            {
                if (this.eyeState == 0)
                {
                    if (this.eyeActivity == "off")
                    {
                        return;
                    }
                    this.eyeAddCounter = this.eyeAddCounter + Level.deltaTime;
                    if (this.eyeAddCounter >= this.eyeAddTime)
                    {
                        this.eyeState = 4;
                        this.eyeAddCounter = this.eyeAddTime;
                        this.btEyeSrike.visible = true;
                        this.btEyeSrike.alpha = 0;
                        this.btEyeSrike.gotoAndPlay(1);
                        TweenNano.to(this.btEyeSrike, 1, {alpha:1});
                        if (Level.levelIndex == 2 && !HintPanels.eyeReady)
                        {
                            hints = this.twr.container.head.allHints;
                            hints.visible = true;
                            hints.alpha = 0;
                            TweenNano.to(hints, 1, {alpha:1});
                        }
                        HintPanels.eyeReady = true;
                    }
                    frm = this.eyeAddCounter / this.eyeAddTime * 100;
                    if (frm > 100)
                    {
                        frm;
                    }
                    this.eyeMc.gotoAndStop(frm);
                }
                else if (this.eyeState == 1)
                {
                    this.eyeMc.play();
                    if (this.eyeMc.currentFrame == this.eyeShootFame)
                    {
                        this.eyeState = 2;
                        this.eyeMc.stop();
                        this.eyeActiveCounter = 0;
                    }
                    if (this.eyeMc.currentFrame == this.eyeShootFame - 8)
                    {
                        this.level.agButton_btn.alpha = 0;
                        this.level.eyeBarPanel.visible = true;
                        this.level.eyeBarPanel.alpha = 0;
                        this.level.eyeBarPanel.eyeBar.gotoAndStop(1);
                        this.level.setChildIndex(this.level.eyeBarPanel, (this.level.numChildren - 1));
                        TweenNano.to(this.level.eyeBarPanel, 0.3, {alpha:1});
                    }
                }
                else if (this.eyeState == 2)
                {
                    Mouse.hide();
                    this.level.c1.visible = true;
                    this.level.c1.x = this.level.mouseX;
                    this.level.c1.y = this.level.mouseY;
                    p = this.eyeMc.a1.inn.localToGlobal(Utilites.ZERO_POINT);
                    this.eyeRay.x = p.x - 400;
                    this.eyeRay.y = p.y - 250;
                    dx = this.eyeRay.parent.mouseY - this.eyeRay.y;
                    dy = this.eyeRay.parent.mouseX - this.eyeRay.x;
                    length = Math.abs(Math.sqrt(dx * dx + dy * dy));
                    this.eyeRay.rotation = 0;
                    this.eyeRay.draw(length);
                    dr = Math.atan2(dy, dx);
                    this.eyeRay.rotation = (-dr) / Utilites.RAD_TO_DEG + 90;
                    this.mover();
                    if (Input.isMouseDown)
                    {
                        if (!this.eyeSound)
                        {
                            this.eyeSound = SoundManager.playLoop("eye_shot_3.1.wav", 0.5);
                        }
                        else
                        {
                            this.eyeSound.vol = SoundManager.enableSound ? (0.5) : (0);
                        }
                        this.eyeRay.visible = true;
                        this.level.eyeEff.visible = true;
                        this.level.eyeEff.x = this.level.mouseX;
                        this.level.eyeEff.y = this.level.mouseY;
                        this.level.shake(2, 50);
                        if (this.level.everyMs(50))
                        {
                            b = new BulletEye(this.level);
                        }
                        p2 = this.eyeMc.globalToLocal(p);
                        this.eyeMc.eyeGlow.x = p2.x;
                        this.eyeMc.eyeGlow.y = p2.y;
                        this.eyeMc.eyeGlow.visible = true;
                        this.tube1.play();
                        if (this.level.everyMs(500))
                        {
                            this.tube2.play();
                        }
                        if (this.level.everyMs(300))
                        {
                            this.tube5.play();
                        }
                    }
                    else
                    {
                        if (this.eyeSound)
                        {
                            this.eyeSound.vol = 0;
                        }
                        this.eyeRay.visible = false;
                        this.level.eyeEff.visible = false;
                        this.eyeMc.eyeGlow.visible = false;
                    }
                    if (this.eyeActivity == "always")
                    {
                        this.eyeActiveCounter = 0;
                    }
                    pr = this.eyeActiveCounter / this.eyeActiveTime;
                    this.level.eyeBarPanel.eyeBar.width = 190 - pr * 190;
                    this.eyeActiveCounter = this.eyeActiveCounter + Level.deltaTime;
                    if (this.eyeActiveCounter >= this.eyeActiveTime)
                    {
                        this.eyeState = 3;
                        this.eyeRay.visible = false;
                        this.level.eyeEff.visible = false;
                        SoundManager.playOnce("eye_closing_5.wav", 0.5);
                        TweenNano.to(this.eyeMc.a1, 8, {alpha:0, delay:5, useFrames:true});
                        TweenNano.to(this.level.eyeBarPanel, 0.3, {alpha:0, onComplete:function ()
            {
                level.eyeBarPanel.visible = false;
                return;
            }// end function
            });
                        this.level.agButton_btn.alpha = 1;
                    }
                }
                else if (this.eyeState == 3)
                {
                    this.stopEyeSound();
                    this.eyeMc.play();
                    if (this.eyeMc.currentFrame == 1)
                    {
                        if (this.restoreUpgrades)
                        {
                            c = this.getCannonByCell(0, 1);
                            if (c)
                            {
                                this.level.bottomMenuUpgr.show(c);
                            }
                        }
                        this.eyeState = 0;
                        this.eyeMc.stop();
                        this.eyeAddCounter = 0;
                    }
                    if (this.level.helps.currentHint == 15)
                    {
                        this.level.helps.hideHint();
                    }
                }
                if (this.eyeState == 1 || this.eyeState == 2 || this.eyeState == 4)
                {
                    this.headGearTime = 500;
                    this.floorGearTime = 500;
                    if (this.level.everyMs(1000))
                    {
                        this.tube3.play();
                    }
                    if (this.level.everyMs(1500))
                    {
                        this.tube4.play();
                    }
                }
            }
            return;
        }// end function

        private function drawConnectedCells() : void
        {
            var _loc_1:Graphics = null;
            var _loc_2:Cell = null;
            var _loc_3:Cell = null;
            this.cannonsContainer.graphics.clear();
            if (this.dragBlock)
            {
                _loc_1 = this.cannonsContainer.graphics;
                _loc_1.beginFill(16777215, 0.03);
                _loc_2 = this.dragBlock.cell;
                if (_loc_2.connectUp)
                {
                    _loc_3 = this.cells[(_loc_2.row + 1)][_loc_2.col];
                    if (_loc_3.state == 0)
                    {
                        _loc_1.drawRect(_loc_3.pos.x, _loc_3.pos.y, Cell.WIDTH, Cell.HEIGHT);
                    }
                }
                if (_loc_2.connectDown)
                {
                    _loc_3 = this.cells[(_loc_2.row - 1)][_loc_2.col];
                    if (_loc_3.state == 0)
                    {
                        _loc_1.drawRect(_loc_3.pos.x, _loc_3.pos.y, Cell.WIDTH, Cell.HEIGHT);
                    }
                }
                if (_loc_2.connectLeft)
                {
                    _loc_3 = this.cells[_loc_2.row][(_loc_2.col - 1)];
                    if (_loc_3.state == 0)
                    {
                        _loc_1.drawRect(_loc_3.pos.x, _loc_3.pos.y, Cell.WIDTH, Cell.HEIGHT);
                    }
                }
                if (_loc_2.connectRight)
                {
                    _loc_3 = this.cells[_loc_2.row][(_loc_2.col + 1)];
                    if (_loc_3.state == 0)
                    {
                        _loc_1.drawRect(_loc_3.pos.x, _loc_3.pos.y, Cell.WIDTH, Cell.HEIGHT);
                    }
                }
            }
            return;
        }// end function

        public function updateAnimation() : void
        {
            var _loc_1:int = 0;
            if (this.tube1.currentFrame == (this.tube1.totalFrames - 1) && this.tube1Count > 0)
            {
                var _loc_2:String = this;
                var _loc_3:* = this.tube1Count - 1;
                _loc_2.tube1Count = _loc_3;
            }
            if (this.tube2.currentFrame == (this.tube2.totalFrames - 1) && this.tube2Count > 0)
            {
                var _loc_2:String = this;
                var _loc_3:* = this.tube2Count - 1;
                _loc_2.tube2Count = _loc_3;
            }
            if (this.tube3.currentFrame == (this.tube3.totalFrames - 1) && this.tube3Count > 0)
            {
                var _loc_2:String = this;
                var _loc_3:* = this.tube3Count - 1;
                _loc_2.tube3Count = _loc_3;
            }
            if (this.tube4.currentFrame == (this.tube4.totalFrames - 1) && this.tube4Count > 0)
            {
                var _loc_2:String = this;
                var _loc_3:* = this.tube4Count - 1;
                _loc_2.tube4Count = _loc_3;
            }
            if (this.tube5.currentFrame == (this.tube5.totalFrames - 1) && this.tube5Count > 0)
            {
                var _loc_2:String = this;
                var _loc_3:* = this.tube5Count - 1;
                _loc_2.tube5Count = _loc_3;
            }
            if (this.tube1Count == 0)
            {
                if (this.tube1.currentFrame == 0)
                {
                    this.tube1.stop();
                }
            }
            else
            {
                this.tube1.play();
            }
            if (this.tube2Count == 0)
            {
                if (this.tube2.currentFrame == 0)
                {
                    this.tube2.stop();
                }
            }
            else
            {
                this.tube2.play();
            }
            if (this.tube3Count == 0)
            {
                if (this.tube3.currentFrame == 0)
                {
                    this.tube3.stop();
                }
            }
            else
            {
                this.tube3.play();
            }
            if (this.tube4Count == 0)
            {
                if (this.tube4.currentFrame == 0)
                {
                    this.tube4.stop();
                }
            }
            else
            {
                this.tube4.play();
            }
            if (this.tube5Count == 0)
            {
                if (this.tube5.currentFrame == 0)
                {
                    this.tube5.stop();
                }
            }
            else
            {
                this.tube5.play();
            }
            if (this.level.everyMs(this.smokeTime))
            {
                this.smokeTime = Utilites.randomInt(1000, 2000);
                _loc_1 = Utilites.randomInt(1, 5);
                if (_loc_1 == 1 && this.tube1Count == 0)
                {
                    var _loc_2:String = this;
                    var _loc_3:* = this.tube1Count + 1;
                    _loc_2.tube1Count = _loc_3;
                }
                else if (_loc_1 == 2 && this.tube2Count == 0)
                {
                    var _loc_2:String = this;
                    var _loc_3:* = this.tube2Count + 1;
                    _loc_2.tube2Count = _loc_3;
                }
                else if (_loc_1 == 3 && this.tube3Count == 0)
                {
                    var _loc_2:String = this;
                    var _loc_3:* = this.tube3Count + 1;
                    _loc_2.tube3Count = _loc_3;
                }
                else if (_loc_1 == 4 && this.tube4Count == 0)
                {
                    var _loc_2:String = this;
                    var _loc_3:* = this.tube4Count + 1;
                    _loc_2.tube4Count = _loc_3;
                }
                else if (_loc_1 == 5 && this.tube5Count == 0)
                {
                    var _loc_2:String = this;
                    var _loc_3:* = this.tube5Count + 1;
                    _loc_2.tube5Count = _loc_3;
                }
            }
            if (this.headGearTime > 0)
            {
                this.headGearTime = this.headGearTime - Level.deltaTime;
                if (this.headGear.currentFrame == (this.headGear.totalFrames - 1))
                {
                    this.headGear.gotoAndStop(0);
                }
                else
                {
                    this.headGear.nextFrame();
                }
            }
            if (this.floorGearTime > 0)
            {
                this.floorGearTime = this.floorGearTime - Level.deltaTime;
                if (this.floorGear.currentFrame == (this.floorGear.totalFrames - 1))
                {
                    this.floorGear.gotoAndStop(0);
                }
                else
                {
                    this.floorGear.nextFrame();
                }
            }
            if (this.level.everyMs(this.headGearCounter) && this.headGearTime <= 0)
            {
                this.headGearTime = Utilites.randomNumber(1500, 2000);
                this.headGearCounter = Utilites.randomNumber(5000, 7000);
            }
            if (this.level.everyMs(this.floorGearCounter) && this.floorGearTime <= 0)
            {
                this.floorGearTime = Utilites.randomNumber(1500, 2000);
                this.floorGearCounter = Utilites.randomNumber(5000, 7000);
            }
            return;
        }// end function

        private function drawCells() : void
        {
            var _loc_3:int = 0;
            var _loc_4:Number = NaN;
            var _loc_5:Number = NaN;
            var _loc_1:* = this.cannonsContainer.graphics;
            _loc_1.clear();
            _loc_1.beginFill(65280, 0.2);
            _loc_1.lineStyle(1, 65280, 0.3);
            var _loc_2:int = 0;
            while (_loc_2 < this.TOTAL_FLOORS)
            {
                
                _loc_3 = 0;
                while (_loc_3 < 3)
                {
                    
                    _loc_4 = this.X_OFFSET + _loc_3 * Cell.WIDTH;
                    _loc_5 = this.Y_OFFSET + _loc_2 * Cell.HEIGHT;
                    _loc_1.drawRect(_loc_4, _loc_5, Cell.WIDTH, Cell.HEIGHT);
                    _loc_3++;
                }
                _loc_2++;
            }
            return;
        }// end function

        private function isCellsConnectsLine(param1:int, param2:int, param3:int, param4:int) : Boolean
        {
            var _loc_7:int = 0;
            var _loc_8:int = 0;
            var _loc_5:* = Utilites.clamp(param4 - param2, -1, 1);
            var _loc_6:* = Utilites.clamp(param3 - param1, -1, 1);
            while (param2 != param4 || param1 != param3)
            {
                
                _loc_7 = param2 + _loc_5;
                _loc_8 = param1 + _loc_6;
                if (!this.isCellsConnects(param1, param2, _loc_8, _loc_7) || this.cells[_loc_8][_loc_7].state == 1)
                {
                    return false;
                }
                param2 = _loc_7;
                param1 = _loc_8;
            }
            return true;
        }// end function

        private function isCellsConnects(param1:int, param2:int, param3:int, param4:int) : Boolean
        {
            var _loc_6:Cell = null;
            var _loc_7:Cell = null;
            var _loc_5:Boolean = false;
            if (this.getCellState(param1, param2) > -1 && this.getCellState(param3, param4) > -1)
            {
                _loc_6 = this.cells[param1][param2];
                _loc_7 = this.cells[param3][param4];
                if (param4 - param2 == 1 && param1 == param3)
                {
                    _loc_5 = _loc_6.connectRight && _loc_7.connectLeft;
                }
                else if (param4 - param2 == -1 && param1 == param3)
                {
                    _loc_5 = _loc_6.connectLeft && _loc_7.connectRight;
                }
                else if (param3 - param1 == 1 && param2 == param4)
                {
                    _loc_5 = _loc_6.connectUp && _loc_7.connectDown;
                }
                else if (param3 - param1 == -1 && param2 == param4)
                {
                    _loc_5 = _loc_6.connectDown && _loc_7.connectUp;
                }
            }
            return _loc_5;
        }// end function

        private function getCellState(param1:int, param2:int) : int
        {
            if (this.cellExists(param1, param2))
            {
                return this.cells[param1][param2].state;
            }
            return -1;
        }// end function

        private function cellExists(param1:int, param2:int) : Boolean
        {
            return param2 < 3 && param2 > -1 && (param1 > -1 && param1 <= this.floorsCount);
        }// end function

        private function moveBlockToCell(param1:Cannon, param2:int, param3:int) : void
        {
            if (param1.cell.col == 1 && param1.cell.row == 0)
            {
                param1.isPodval = false;
                this.onCannolLeavePodval();
            }
            if (param3 == 1 && param2 == 0)
            {
                param1.isPodval = true;
                TweenNano.to(this.btArrowUp, 0.3, {alpha:0});
                this.showLift(0.2);
                this.level.bottomMenu.hideAll();
                this.level.bottomMenuUpgr.show(param1);
            }
            param1.isAnimating = true;
            param1.animDir.x = param1.cell.col - param3;
            param1.animDir.y = param1.cell.row - param2;
            param1.cell.state = 0;
            param1.cell = this.cells[param2][param3];
            param1.cell.state = 1;
            TweenNano.to(param1, 0.2, {x:param1.cell.pos.x, y:param1.cell.pos.y, ease:Linear.easeInOut, onComplete:this.afterAnimation, onCompleteParams:[param1]});
            if (param1.cell.col == 0 || param1.cell.col == 2)
            {
                HintPanels.cannonDragged = true;
            }
            return;
        }// end function

        public function onCannolLeavePodval() : void
        {
            TweenNano.to(this.btArrowUp, 0.3, {alpha:1});
            this.hideLift(0.5);
            this.level.bottomMenuUpgr.hideAll();
            return;
        }// end function

        private function afterAnimation(param1:Cannon) : void
        {
            param1.isAnimating = false;
            param1.animDir.x = 0;
            param1.animDir.y = 0;
            return;
        }// end function

        public function updateClock() : void
        {
            var _loc_1:* = new Date();
            if (this.prevDate.hours != _loc_1.hours)
            {
                SoundManager.playOnce("snd_clock_chime", 0.3);
                Achivements.clockActive = true;
            }
            this.prevDate = _loc_1;
            var _loc_2:* = _loc_1.minutes / 59;
            var _loc_3:* = _loc_2 * 360;
            var _loc_4:* = (_loc_1.hours + _loc_2) % 12 / 12 * 360;
            var _loc_5:* = _loc_1.seconds / 59 * 360;
            this.twr.container.head.clock.arrow_minute.rotation = _loc_3;
            this.twr.container.head.clock.arrow_hours.rotation = _loc_4;
            this.twr.container.head.clock.arrow_second.rotation = _loc_5;
            return;
        }// end function

        private function showLift(param1:Number = 1.2, param2:Boolean = false) : void
        {
            if (param2)
            {
                SoundManager.playOnce("snd_lift_up");
            }
            else
            {
                SoundManager.playOnce("snd_lift_down", 0.7);
            }
            this.twr.lift.y = 490;
            TweenNano.to(this.twr.lift, param1, {y:440});
            return;
        }// end function

        public function hideLift(param1:Number = 1.2) : void
        {
            if (param1 > 0)
            {
                SoundManager.playOnce("snd_lift_down", 0.7);
            }
            TweenNano.killTweensOf(this.twr.lift);
            TweenNano.to(this.twr.lift, param1, {y:490});
            return;
        }// end function

        public function upgradeCannon(param1:Cannon, param2:int) : void
        {
            var funishAnim:Function;
            var cannon:* = param1;
            var upgrInd:* = param2;
            funishAnim = function () : void
            {
                var showUpgrade:Function;
                showUpgrade = function () : void
                {
                    if (cannon.isPodval)
                    {
                        level.bottomMenu.hideAll();
                        level.bottomMenuUpgr.show(cannon);
                    }
                    return;
                }// end function
                ;
                isAnimating = false;
                cannon.setUpgrade(upgrInd);
                TweenNano.to(cannon, 0.5, {y:cannon.cell.pos.y, onComplete:showUpgrade});
                showLift(0.5);
                SoundManager.playOnce("snd_steam1", 0.5);
                addPar();
                return;
            }// end function
            ;
            Saves.curSaves.isCannonUpgrade = true;
            TweenNano.delayedCall(0.3, SoundManager.playOnce, ["snd_building"]);
            TweenNano.to(cannon, 0.5, {y:cannon.y + Cell.HEIGHT, onComplete:funishAnim});
            this.hideLift(0.5);
            this.isAnimating = true;
            return;
        }// end function

        private function addPar() : void
        {
            var _loc_1:* = Main.rastFactory.getMovieClip("podval_par2");
            _loc_1.y = 225;
            this.level.addEffect(_loc_1);
            return;
        }// end function

        public function isEyeActive() : Boolean
        {
            return this.eyeState == 1 || this.eyeState == 2 || this.eyeState == 3;
        }// end function

        private function mover(event:MouseEvent = null) : void
        {
            var _loc_2:MovieClip = null;
            if (this.eyeMc.a1)
            {
                _loc_2 = this.eyeMc.a1;
                if (this.u_wid == int.MAX_VALUE)
                {
                    this.u_wid = _loc_2.inn.width;
                }
                this.drry = this.eyeMc.mouseY - _loc_2.y;
                this.drrx = this.eyeMc.mouseX - _loc_2.x;
                this.rrrangle = Math.atan2(this.drry, this.drrx);
                _loc_2.rotation = this.rrrangle * 180 / Math.PI;
                this.lentth = Math.abs(Math.sqrt(this.drrx * this.drrx + this.drry * this.drry));
                if (this.lentth > 15)
                {
                    _loc_2.inn.x = _loc_2.inn.x + (15 - _loc_2.inn.x) / 5;
                }
                else
                {
                    _loc_2.inn.x = _loc_2.inn.x + (this.lentth - _loc_2.inn.x) / 5;
                }
                if (this.lentth > 15)
                {
                    _loc_2.inn.width = this.u_wid / 2;
                }
                else
                {
                    _loc_2.inn.width = this.u_wid - this.lentth * 100 / this.u_wid * this.u_wid / 2 / 100;
                }
            }
            return;
        }// end function

        public function addEffectRicoshet(param1:Enemy) : void
        {
            if (this.ricoshetCount >= 5)
            {
                return;
            }
            var _loc_2:* = new Ricoshet1Small();
            var _loc_3:* = 52 * (5 - this.floorsCount);
            var _loc_4:* = -130 + _loc_3;
            var _loc_5:* = -130 + _loc_3 + 300 - _loc_3;
            var _loc_6:* = Utilites.randomNumber(_loc_4, _loc_5);
            if (param1 is Unit1 || param1 is Unit2 || param1 is Tanket || param1 is Tank1 || param1 is Tank2 || param1 is Tank3 || param1 is Tank4 || param1 is Car)
            {
                _loc_6 = Utilites.randomNumber(param1.y - 200, param1.y - 80);
            }
            else if (param1 is Walker1 || param1 is Walker2)
            {
                _loc_6 = Utilites.randomNumber(param1.y - 30, param1.y + 30);
            }
            else if (param1 is Airplane)
            {
                _loc_6 = param1.levelY + 30;
            }
            else if (param1 is Helicopter)
            {
                _loc_6 = Utilites.randomNumber(param1.y - 30, param1.y + 30);
            }
            else if (param1 is Balloon || param1 is Aerostat)
            {
                _loc_6 = Utilites.randomNumber(param1.y + 30, param1.y + 40);
            }
            else if (param1 is Airship)
            {
                _loc_6 = Utilites.randomNumber(param1.y + 50, param1.y + 100);
            }
            _loc_6 = Utilites.clamp(_loc_6, _loc_4, _loc_5);
            _loc_2.x = Utilites.randomNumber(-48, 50);
            _loc_2.y = _loc_6;
            this.level.addChild(_loc_2);
            var _loc_7:* = new AutoRemoveObject(_loc_2, this.onRicoshetRemove);
            return;
        }// end function

        private function onRicoshetRemove() : void
        {
            var _loc_1:String = this;
            var _loc_2:* = this.ricoshetCount - 1;
            _loc_1.ricoshetCount = _loc_2;
            return;
        }// end function

        public function dispose() : void
        {
            var _loc_2:int = 0;
            var _loc_1:int = 0;
            while (_loc_1 <= this.TOTAL_FLOORS)
            {
                
                _loc_2 = 0;
                while (_loc_2 < 3)
                {
                    
                    this.cells[_loc_1][_loc_2].dispose();
                    _loc_2++;
                }
                _loc_1++;
            }
            this.cells = null;
            this.removeCannonsEvents();
            _loc_1 = 0;
            while (_loc_1 < this.cannons.length)
            {
                
                this.cannons[_loc_1].dispose();
                _loc_1++;
            }
            this.cannons = null;
            removeChild(this.cannonsContainer);
            this.cannonsContainer = null;
            this.eyeMc = null;
            this.eyeRay.dispose();
            this.eyeRay = null;
            this.btEyeSrike.removeEventListener(MouseEvent.CLICK, this.btEyeSrikeClick);
            this.btEyeSrike = null;
            this.floors = null;
            this.tube1.dispose();
            this.tube2.dispose();
            this.tube3.dispose();
            this.tube4.dispose();
            this.tube5.dispose();
            this.btTube1.removeEventListener(MouseEvent.CLICK, this.tubeSmoke);
            this.btTube2.removeEventListener(MouseEvent.CLICK, this.tubeSmoke);
            this.btTube3.removeEventListener(MouseEvent.CLICK, this.tubeSmoke);
            this.btTube4.removeEventListener(MouseEvent.CLICK, this.tubeSmoke);
            this.btTube5.removeEventListener(MouseEvent.CLICK, this.tubeSmoke);
            this.btTube1 = null;
            this.btTube2 = null;
            this.btTube3 = null;
            this.btTube4 = null;
            this.btTube5 = null;
            this.headGear.dispose();
            this.headGear = null;
            this.floorGear.dispose();
            this.floorGear = null;
            this.btHeadGear.removeEventListener(MouseEvent.CLICK, this.addHeadGearTime);
            this.btHeadGear = null;
            this.btFloorGear.removeEventListener(MouseEvent.CLICK, this.addFloorGearTime);
            this.btFloorGear = null;
            stage.removeEventListener(MouseEvent.MOUSE_UP, this.mouseUpHandler);
            stage.removeEventListener(MouseEvent.CLICK, this.stageClick);
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, this.moveTarget);
            this.btArrowUp.removeEventListener(MouseEvent.CLICK, this.showBuyMenu);
            stage.removeEventListener(MouseEvent.MOUSE_DOWN, this.blockMouseDown);
            this.moveDir = null;
            this.showInfoCannon = null;
            this.dragBlock = null;
            if (parent)
            {
                parent.removeChild(this);
            }
            this.level = null;
            return;
        }// end function

        public function removeCannonsEvents() : void
        {
            var _loc_1:int = 0;
            while (_loc_1 < this.cannons.length)
            {
                
                this.cannons[_loc_1].removeEventListener(MouseEvent.CLICK, this.blockClick);
                _loc_1++;
            }
            return;
        }// end function

    }
}
