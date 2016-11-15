@Helpers = {}
Helpers.readCookie = (name) ->
  nameEQ = name + "="
  ca = document.cookie.split(";")
  i = 0
  while i < ca.length
    c = ca[i]
    c = c.substring(1, c.length)  while c.charAt(0) is " "
    return c.substring(nameEQ.length, c.length).replace(/"/g, '')  if c.indexOf(nameEQ) is 0
    i++
  ca

Helpers.setCookie = (cookieName, cookieValue) ->
   today = new Date()
   expire = new Date("2015-01-01 12:00:00")
   document.cookie = cookieName + "=" + escape(cookieValue) + ";expires=" + expire.toGMTString();
