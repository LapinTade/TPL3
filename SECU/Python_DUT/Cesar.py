def fonction(n,z):
	mot=""
	for lettre in n:
		s=ord(lettre)
		z=z%26
		if s<91 and s+z>90 or s>=91 and s+z>122:
			s=s-(26-z)
			m=chr(s)
			mot+=str(m)

		else:
			s=s+z
			m=chr(s)
			mot+=str(m)
	return mot

if __name__ == '__main__':

	n=raw_input('Entrer un mot a crypter ')
	z=input('Decalage ? ')
	print fonction(n,z)

	n=raw_input('Entrer un mot a decrypter ')
	z=input('Decalage ? ')
	print fonction(n,26-z%26)

