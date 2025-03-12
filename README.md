# MinilibC

## Description

Le projet MinilibC consiste à recréer une partie de la bibliothèque standard de C en x86-64 Assembly. L'objectif est de créer une bibliothèque ELF dynamique (libasm.so) permettant de remplacer certaines fonctions standard via LD_PRELOAD.

## Compilation

Le projet est compilé avec un Makefile, qui inclut les règles suivantes :

```make``` : Compile la bibliothèque dynamique libasm.so

```make clean``` : Supprime les fichiers objets

```make fclean``` : Supprime les fichiers objets et la bibliothèque compilée

```make re``` : Recompile entièrement le projet

Toutes les sources doivent être assemblées avec nasm et les fichiers objets liés avec ld.

## Fonctions implémentées

Les fonctions suivantes ont été réimplémentées en Assembly :

- strlen

- strchr

- strrchr

- memset

- memcpy

- strcmp

- memmove

- strncmp

- strcasecmp

- strstr

- strpbrk

- strcspn
