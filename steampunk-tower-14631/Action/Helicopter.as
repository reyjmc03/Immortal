package 
{
    import Enemy.*;
    import Helicopter.*;
    import flash.display.*;
    import flash.geom.*;

    public class Helicopter extends Enemy
    {
        private var shootCount:int = 3;
        private var shootCouter:int = 0;

        public function Helicopter()
        {
            health = 100;
            minDamage = 2;
            maxDamage = 4;
            return;
        }// end function

        override public function initialize(param1:Level) : void
        {
            infoName = "Helicopter";
            shootSpeed = 2000;
            armor = 1;
            money = 1800;
            modifers.lightAdd = 20;
            modifers.sawAdd = 20;
            modifers.gunIgnore = 20;
            collideRadiuses.push(new CollideRadius(this, 0, 0, 15));
            collideRadiuses.push(new CollideRadius(this, -22, 5, 8));
            collideRadiuses.push(new CollideRadius(this, 37, -3, 10));
            mcName = "HelicopterMc";
            super.initialize(param1);
            walk1 = 1;
            walk2 = 20;
            aim1 = 21;
            aim2 = 30;
            shoot1 = 31;
            shoot2 = 50;
            healthY = -20;
            healthW = 55;
            speed = -1.2 * scaleX;
            stopX = Utilites.randomInt(150, 170) * scaleX;
            y = Utilites.randomNumber(-40, 50);
            fireEffect = "FireHeli";
            shockEffect = "ShockHeli";
            isAir = true;
            selectRct = new Rectangle(-7.5, 17.75, 64.35, 11.55);
            return;
        }// end function

        override public function update() : void
        {
            super.update();
            if (state == 2)
            {
                if (level.everyMs(shootSpeed))
                {
                    this.shootCouter = 0;
                }
                if (level.everyMs(200) && this.shootCouter < this.shootCount)
                {
                    var _loc_1:String = this;
                    var _loc_2:* = this.shootCouter + 1;
                    _loc_1.shootCouter = _loc_2;
                    this.shoot();
                }
            }
            return;
        }// end function

        override protected function updateAnimation() : void
        {
            if (state == 0 && walk2 != -1 && mcEnemy.currentFrame == (walk2 + 1))
            {
                mcEnemy.gotoAndPlay(walk1);
            }
            else if (state == 1)
            {
                if (aim1 == -1 || mcEnemy.currentFrame == aim2)
                {
                    state = 2;
                }
            }
            else if (mcEnemy.currentFrame == shoot2)
            {
                mcEnemy.gotoAndPlay(shoot1);
            }
            return;
        }// end function

        override protected function shoot() : void
        {
            super.shoot();
            var _loc_1:* = new Splash();
            var _loc_2:* = new AutoRemoveObject(_loc_1);
            _loc_1.x = -45;
            _loc_1.y = 10;
            _loc_1.scaleX = -1;
            addChild(_loc_1);
            return;
        }// end function

        override protected function createDieEffect() : void
        {
            var _loc_1:RastrMovieClip = null;
            _loc_1 = Main.rastFactory.getMovieClip("Explode2");
            _loc_1.x = x;
            _loc_1.y = y;
            level.addEffect(_loc_1);
            return;
        }// end function

    }
}
