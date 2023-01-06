# Zadanie testowe
Grudzień 2022


## Opis zadania:
* Wykonanie prostej aplikacji opartej o logic flow pokazany na designach Figma (dostarczono link do projektu Figma)
* Ekrany mogą zostać zbudowane w dowolny sposów (xib, kod, storyboars)
* Aplikacja powinna byc napisana w Swit z uzyciem MVVM oraz z zasotsowaniem praktyk SOLID

## Opis projektu:
Aplikacja składa się z 4 ekranów:

* logowania
* listy newsów pobranych z api: [https://newsapi.org/v2/top-headlines](https://newsapi.org/v2/top-headlines)
* szczegółów wybranej wiadomości
* profilu usera

### 1. Ekran logowania (*LoginViewController*)
Ekran logowania nie będzie posiadał prawdziwej autentykacji - zostanie ona zamockowana.
Mechanizm logowania bedzie opierał sie na prostym warunku logicznym:

**Happy path:**
Po wprowadzeniu loginu i hasła, a nastepnie po kliknięciu w przycisk login - aplikacja powinna przekierować użytkownika na ekran główny.

Dane do logowania:

	login: Admin 
	password: Admin1234

lub

	login: Kasia
	password: Kasia1234

**Unhappy path:**
Jeśli, wystąpi któryś z ponizszych warunkow - to próba logowania powinna zakończyc sie komunikatem:

### Komunikat błędu:

- Title: *Error*
- Message: *Logowanie się nie powiodło.*

### Przypadki:

- pola nie mogą być puste
- podanie innych danych niż wskazane w punkcie happy path


### 2. Ekran główny (*MainViewController*)
W Nagłówku ma pojawić się imię osoby zalogowanej: *New's for Kasia* lub *News's for Admin* - w zależności kto się zalogował.

Poniżej ma się pojawić lista artykułów pobrana z API.

Komórka powinna zawierać informację takie jak:

* author
* title

### 3. Ekran detali (*DetailsViewController*)
Zawiera on rozszerzone informacje o artykule.
W nagłówku tego ekranu powinien znaleźć się Autor tekstu.
Na tym widoku powinny pojawić się nastepujące informacje:

- author
- title
- description
- published at
- image

### 4. Ekran profilu usera (*UserViewController*)
Powinien wyświetlać: 

- Obrazek:
 - dla Admina: piłka nożna
 - dla Kasi: piesek

- Name: imię zalogowanej osoby
- Last login: tutaj powinna wyświetlać się data ostatniego logowania

## Realizacja zadania:
* zastosowano architekturę MVVM + C
* wszystkie widoki zostały utworzone w postaci plików Xib
* główny kontroler aplikacji oparty jest o **UITabBarController**
* za warstwę networking odpowiada **DataService** wykorzystujący URLSession
 * dodano customową obsługę błędów, jakie mogą się wydarzyć podczas komunikacji z API
* do pobierania obrazków i ich wyświetlania wykorzystano zewnętrze rozwiązanie **Kingfisher**, które dodano do projektu z wykorzystaniem **SPM**
