local M = {}

-- Configuración por defecto

M.data = {
	-- Otras categorías...
	--
	["📂 types"] = {
		folder = "📂",
		files = "📄",
		database = "🗄️",
		spreadsheet = "📊",
		powerpoint = "📑",
		image = "🖼️",
		video = "📹",
		audio = "🎵",
		zip = "📦",
		pdf = "📕",
		code = "</>",
	},
	["  media"] = {
		play = "►", -- Icono de play alternativo
		pausa = "❚❚", -- Icono de pausa alternativo
		stop = "■", -- Icono de stop alternativo
		siguiente = "⏭", -- Icono de siguiente alternativo
		anterior = "⏮", -- Icono de anterior alternativo
		grabar = "●", -- Icono de grabar alternativo   play = "", -- Icono de play
		volumen_alto = "🔊", -- Icono de volumen alto
		volumen_bajo = "🔉", -- Icono de volumen bajo
		silencio = "🔇", -- Icono de silencio
		microfono = "🎤", -- Icono de micrófono
		camara = "📷", -- Icono de cámara
		altavoz = "🔈", -- Icono de altavoz
		auriculares = "🎧", -- Icono de auriculares
		musica = "🎵", -- Icono de música
		nota_musical = "🎶", -- Icono de notas musicales
		pelicula = "🎬", -- Icono de película
		television = "📺", -- Icono de televisión
		radio = "📻", -- Icono de radio
		reloj = "", -- Icono de reloj (cronómetro)
		calendario = "📅", -- Icono de calendario
	},
	["😊 emojis"] = {
		feliz = "😊",
		triste = "😢",
		enojado = "😠",
		sorprendido = "😮",
		pensativo = "🤔",
		asustado = "😨",
		enamorado = "😍",
		riendo = "😂",
		guinyo = "😉",
		beso = "😘",
		neutral = "😐",
		dormido = "😴",
		enfermo = "🤒",
		confundido = "😕",
		avergonzado = "😳",
		cool = "😎",
		llorando = "😭",
		gritando = "😱",
		silbando = "😗",
		con_corazon = "🥰",
	},
	["🍎 comida"] = {
		manzana = "🍎",
		platano = "🍌",
		uvas = "🍇",
		fresa = "🍓",
		sandia = "🍉",
		naranja = "🍊",
		limon = "🍋",
		melocoton = "🍑",
		cereza = "🍒",
		pera = "🍐",
		kiwi = "🥝",
		mango = "🥭",
		["piña"] = "🍍",
		coco = "🥥",
		berenjena = "🍆",
		zanahoria = "🥕",
		maiz = "🌽",
		pimiento = "🫑",
		tomate = "🍅",
		lechuga = "🥬",
		brocoli = "🥦",
		ajo = "🧄",
		cebolla = "🧅",
		patata = "🥔",
		batata = "🍠",
		pan = "🍞",
		croissant = "🥐",
		baguette = "🥖",
		pretzel = "🥨",
		queso = "🧀",
		huevo = "🥚",
		bacon = "🥓",
		carne = "🥩",
		pollo = "🍗",
		pescado = "🐟",
		camarones = "🦐",
		cangrejo = "🦀",
		calamar = "🦑",
		sushi = "🍣",
		dango = "🍡",
		donut = "🍩",
		galleta = "🍪",
		pastel = "🍰",
		cupcake = "🧁",
		helado = "🍨",
		paleta = "🍭",
		chocolate = "🍫",
		caramelo = "🍬",
		miel = "🍯",
		palomitas = "🍿",
		salchicha = "🌭",
		pizza = "🍕",
		hamburguesa = "🍔",
		patatas_fritas = "🍟",
		taco = "🌮",
		burrito = "🌯",
		falafel = "🧆",
		huevo_frito = "🍳",
		ensalada = "🥗",
		sopa = "🍲",
		olla = "🍜",
		tazon = "🍚",
		cuchara = "🥄",
		tenedor = "🍴",
		cuchillo = "🔪",
		plato = "🍽️",
		copa = "🍷",
		cerveza = "🍺",
		sake = "🍶",
		te = "🍵",
		cafe = "☕",
		batido = "🥤",
		bebida = "🧃",
		botella = "🍾",
		vaso = "🥃",
		copa_cocktail = "🍸",
		copa_champagne = "🍾",
	},
	["🚗 Señales de tráfico"] = {
		semaforo = "🚦",
		stop = "🛑",
		ceda_el_paso = "⛔",
		direccion_prohibida = "🚫",
		prohibido_estacionar = "🚷",
		prohibido_circular = "🚳",
		prohibido_adelantar = "🚷",
		prohibido_entrar = "⛔",
		obras = "🚧",
		animales_sueltos = "🐾",
		["niños"] = "🚸",
		bicicletas = "🚲",
		zona_escolar = "🚸",
		zona_hospital = "🏥",
		zona_residencial = "🏘️",
		zona_comercial = "🏬",
		zona_industrial = "🏭",
		carretera = "🛣️",
		puente = "🌉",
		tunel = "🚇",
		area_descanso = "🛋️",
		gasolinera = "⛽",
		taller = "🔧",
		telefono_emergencia = "📞",
		policia = "👮",
		ambulancia = "🚑",
		bomberos = "🚒",
		estacionamiento_discapacitados = "♿",
	},
	["🔧 herramientas"] = {
		martillo = "🔨",
		destornillador = "🪛",
		llave_inglesa = "🔧",
		sierra = "🪚",
		taladro = "🪛",
		ordenador = "💻",
		raton = "🖱️",
		impresora = "🖨️",
		disco_duro = "💽",
		usb = "💾",
		ladrillo = "🧱",
		escalera = "🪜",
		pincel = "🖌️",
		rotulador = "🖍️",
		pintura = "🎨",
		lienzo = "🖼️",
		paleta = "🎨",
	},
}

-- Función para permitir al usuario sobrescribir la configuración
function M.setup(user_config)
	if user_config and user_config.data then
		M.data = vim.tbl_deep_extend("force", M.data, user_config.data)
	end
end

-- Cargar los datos desde 'data.lua'

return M
