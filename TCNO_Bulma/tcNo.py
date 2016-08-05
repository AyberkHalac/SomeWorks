def tcno_checksum(tcno):
    if len(str(tcno)) == 9:
        tc = '%d' % tcno
        tc10 = int(tc[0]) + int(tc[2]) + int(tc[4]) + int(tc[6]) + int(tc[8])
        tc10 *= 7
        tc10 -= int(tc[1]) + int(tc[3]) + int(tc[5]) + int(tc[7])
        tc10 %= 10
        tc11 = int(tc[0]) + int(tc[1]) + int(tc[2]) + int(tc[3]) + int(tc[4])
        tc11 += int(tc[5]) + int(tc[6]) + int(tc[7]) + int(tc[8]) + int(tc10)
        tc11 %= 10
        return '%s%d%d' % (tc, tc10, tc11)
    else:
        return 0


def previous_one(tcno, familySerialNumber):
    tc = int(tcno[0:-2])
    for i in range(1, familySerialNumber + 1):
        atc = tcno_checksum(tc)
        print((familySerialNumber - i + 1), ". -> ", atc)
        tc += 29999


def familyNumbers(TC_NO, familySerialNumber):
    if familySerialNumber == 1:
        exit()
    tcP1 = int(TC_NO[0:5])
    tcP2 = int(TC_NO[5:9])
    tcP1 += 3
    tcP2 -= 1
    tcP3 = (int(str(tcP1)[0]) + int(str(tcP1)[2]) + int(str(tcP1)[4]) + int(str(tcP2)[1]) + int(str(tcP2)[3]))
    tcP3 *= 7
    tcP3 -= (int(str(tcP1)[1]) + int(str(tcP1)[3]) + int(str(tcP1)[4]) + int(str(tcP2)[0]) + int(str(tcP2)[2]))
    tcP3 %= 10

    tcP4 = (int(str(tcP1)[0]) + int(str(tcP1)[1]) + int(str(tcP1)[2]) + int(str(tcP1)[3]) + int(str(tcP1)[4]) + int(
        str(tcP2)[0]) + int(str(tcP2)[1]) + int(str(tcP2)[2]) + int(str(tcP2)[3]) + tcP3)
    tcP4 %= 10
    print('%d -> %s%s%s%s' % (familySerialNumber - 1, tcP1, tcP2, tcP3, tcP4))
    return familyNumbers(('%s%s%s%s' % (tcP1, tcP2, tcP3, tcP4)), familySerialNumber - 1)


familySerialNumber = 2
familyNumbers('10562272296', familySerialNumber)















# tcNo = input('Lutfen 11 Haneli TC Numaranizi Giriniz: ')
# familySerialNumber = input('Lutfen Aile Sira Numaranizi Giriniz: ')
