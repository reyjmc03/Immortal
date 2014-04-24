package 
{
    import Enemy.*;
    import Parashutist.*;
    import flash.geom.*;

    public class Parashutist extends Enemy
    {
        private var ySpeed:Number = 2.5;
        private var stopY:Number = 200;
        public var wave:Wave;

        public function Parashutist()
        {
            health = 10;
            minDamage = 1;
            maxDamage = 4;
            return;
        }// end function

        override public function initialize(param1:Level) : void
        {
            infoName = "Parachutist";
            armor = 0;
            money = 300;
            isAir = true;
            modifers.lightAdd = 15;
            modifers.gunIgnore = 20;
            modifers.sawIgnore = 20;
            collideRadiuses.push(new CollideRadius(this, 0, 0, 10));
            collideRadiuses.push(new CollideRadius(this, 0, -30, 22));
            mcName = "ParashutistMC";
            super.initialize(param1);
            walk1 = 1;
            walk2 = 40;
            die1 = 41;
            die2 = mcEnemy.totalFrames;
            healthY = -60;
            healthW = 30;
            speed = -1.8 * scaleX;
            line = 9;
            y = -300;
            x = Utilites.randomNumber(150, 350);
            if (side == "left")
            {
                x = x * -1;
            }
            this.stopY = 230 - Utilites.randomNumber(10, 40);
            fireEffect = "FireUnit1";
            shockEffect = "ShockUnit1";
            selectRct = new Rectangle(-0.45, 13.6, 28.85, 7.4);
            return;
        }// end function

        override protected function updateMove() : void
        {
            var _loc_1:Unit1 = null;
            this.calcLine();
            if (alive && y + 3 > this.stopY)
            {
                _loc_1 = new Unit1();
                _loc_1.side = side;
                if (side == "left")
                {
                    _loc_1.x = _loc_1.x * -1;
                }
                level.addEnemy(_loc_1);
                _loc_1.health = _loc_1.health * (health / maxHealth);
                _loc_1.x = x;
                _loc_1.y = y;
                alive = false;
                if (this.wave)
                {
                    this.wave.replaceEnemy(this, _loc_1);
                }
                dispose();
            }
            if (!alive && mcEnemy.currentFrame < 100)
            {
                if (effects.length == 1)
                {
                    effects[0].y = effects[0].y - this.ySpeed;
                }
                if (y > this.stopY)
                {
                    y = this.stopY;
                    this.ySpeed = 0;
                    mcEnemy.gotoAndPlay(100);
                }
                else if (mcEnemy.currentFrame == 99)
                {
                    mcEnemy.gotoAndPlay(55);
                }
                this.ySpeed = this.ySpeed + 1 * Level.deltaTime / 1000;
            }
            y = y + this.ySpeed;
            return;
        }// end function

        private function calcLine() : void
        {
            if (y >= 120)
            {
                line = 1;
            }
            else if (y < 120 && y >= 70)
            {
                line = 2;
            }
            else if (y < 70 && y >= 20)
            {
                line = 3;
            }
            else if (y < 20 && y >= -30)
            {
                line = 4;
            }
            else if (y < -30 && y >= -80)
            {
                line = 5;
            }
            else
            {
                line = 9;
            }
            return;
        }// end function

        override protected function fireUp() : void
        {
            return;
        }// end function

        override protected function shockUp() : void
        {
            return;
        }// end function

        override protected function createDieEffect() : void
        {
            return;
        }// end function

        override protected function die(param1:Bullet = null) : void
        {
            if (!alive)
            {
                return;
            }
            super.die(param1);
            this.ySpeed = this.ySpeed * 3;
            this.stopY = this.stopY + 10;
            var _loc_2:* = Main.rastFactory.getMovieClip("ParBreakrAnim");
            _loc_2.x = -20;
            _loc_2.y = -55;
            addEffect(_loc_2, _loc_2.totalFrames);
            return;
        }// end function

    }
}
