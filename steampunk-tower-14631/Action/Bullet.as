package 
{
    import Bullet.*;
    import flash.display.*;
    import flash.geom.*;

    public class Bullet extends Object
    {
        public var isDummy:Boolean = false;
        public var damage:Number;
        public var target:Enemy;
        public var cannon:Cannon;
        protected var effect:MovieClip;
        protected var addExp:Boolean = false;
        public var isCritical:Boolean = false;
        protected var isFireUp:Boolean = false;
        protected var isShockUp:Boolean = false;
        public var mc:MovieClip;

        public function Bullet()
        {
            return;
        }// end function

        public function initialize(param1:Enemy, param2:Cannon, param3:Point, param4:Number, param5:Boolean, param6:Boolean) : void
        {
            this.target = param1;
            this.cannon = param2;
            this.damage = param4;
            this.isCritical = param5;
            this.addExp = param6;
            param2.level.bullets.push(this);
            return;
        }// end function

        public function update() : void
        {
            return;
        }// end function

        public function onCollision() : Boolean
        {
            if (this.addExp)
            {
                this.cannon.addExperience(this.damage);
            }
            return this.target.hit(this.damage, this, this.isFireUp, this.isShockUp, this.isCritical, this.isDummy);
        }// end function

        public function dispose() : void
        {
            if (this.cannon && this.cannon.level && this.cannon.level.bullets)
            {
                this.cannon.level.bullets.splice(this.cannon.level.bullets.indexOf(this), 1);
            }
            if (this.mc && this.mc.parent)
            {
                this.mc.parent.removeChild(this.mc);
            }
            this.mc = null;
            this.cannon = null;
            this.target = null;
            this.effect = null;
            return;
        }// end function

    }
}
