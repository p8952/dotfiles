node default {
	include bash
	include vim

	case defined(Package['x11-apps/xinit']) {
		true: {
			include xinit
		}
	}

}
