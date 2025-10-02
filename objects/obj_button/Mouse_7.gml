switch(button_id) {
	case 0:
		if(instance_exists(obj_h2o)) {
			obj_h2o.set_brush(DEG0, FREE, AIR, 0.0);
		}
		break;
	case 1:
		if(instance_exists(obj_h2o)) {
			obj_h2o.set_brush(DEG0, FREE, AIR, 1.0);
		}
		break;
	case 2:
		if(instance_exists(obj_h2o)) {
			obj_h2o.set_brush(DEG0, FREE, SNOW, 1.0);
		}
		break;
	case 3:
		if(instance_exists(obj_h2o)) {
			obj_h2o.set_brush(DEG0, FREE, ICE, 1.0);
		}
		break;
	default:
		if(instance_exists(obj_h2o)) {
			obj_h2o.set_brush(DEG0, FREE, WATER, 1.0);
		}
		break;
}