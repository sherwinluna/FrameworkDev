<!DOCTYPE html>
<html>
    <head>
        <title>My Website</title>
    </head>
<body>

    <nav>
        <x-nav-link href="/">Home</x-nav-link>
        <x-nav-link href="/about">About</x-nav-link>
        <x-nav-link href="/contact">Contact</x-nav-link>
    </nav>

    <header>
        {{ $heading }}
    </header>

    <main>
        {{ $slot }}
    </main>

</body>
</html>