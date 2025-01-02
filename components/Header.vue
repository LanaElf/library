<template>
    <div class="w-screen flex justify-center p-10 bg-header">
       <h1 class="neon-stroke font-play-bold text-7xl">IT-читальня</h1>
    </div>
    <MainMenu />
</template>

<style>
.neon-bg {
    animation: neon-bg 2s linear infinite alternate-reverse;
}

@keyframes neon-bg {
    from { background: #ffa8bf;}
    to { background: #a8acff; }
}

.neon-stroke {
    color: transparent;
    animation: neon-stroke 2s linear infinite alternate-reverse;
}

@keyframes neon-stroke {
    from { -webkit-text-stroke: 3px #ffa8bf;}
    to { -webkit-text-stroke: 3px #a8acff; }
}

.bg-header {
    background: linear-gradient(0deg, rgba(85,87,120,1) 0%, rgba(0,0,0,1) 100%);
}
</style>