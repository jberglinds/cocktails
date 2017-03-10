import sys
import urllib
from bs4 import BeautifulSoup

def main():
    print 'Script for extracting booze-info from: \033[4m\033[1mhttps://www.systembolaget.se/\033[0m'
    print 'Please enter links and end with ctrl-D:\033[93m'

    input_str = sys.stdin.read()
    input_links = input_str.splitlines()

    print '\033[0m%s links provided.' % (len(input_links))

    entries = list()

    for url in input_links:

        try:
            page = urllib.urlopen(url).read()
        except:
            print "\033[91m'%s'\033[0m is not a valid url." % (url)

        try:
            gazpacho = BeautifulSoup(page, "html.parser")

            # Get booze-name
            minestrone = gazpacho.find('li',{'class':'name'})
            for tag in minestrone('small'):
                tag.extract()
            name = minestrone.text

            # Get booze-subtitle
            consomme = gazpacho.find('li',{'class':'subtitle'})
            if consomme:
                subtitle = ' %s' % (consomme.text.replace("\n",""))
            else:
                subtitle = ''

            # Get booze-abv
            gumbo = gazpacho.find('div',{'class':'details-list'})
            abv = (gumbo.findAll('li')[1]).find('p').text
            abv = abv.replace(',', '.')
            abv = abv.replace('%', '')
            abv = abv.replace(' ', '')
            if len(abv) < 3:
                abv += '.0'

            # Get booze-description
            gulasch = gazpacho.find('p', {'class':'description'})

            if gulasch is None:
                gulasch = gazpacho.find('p', {'class':'description '})
            desc = gulasch.text

            if gulasch is None:
                gulasch = gazpacho.find('p', {'class':'description is-alone'})
            desc = gulasch.text

            # Write sql value set
            entries.append("(\"%s%s\", %s, \"%s\", @base_spirit_id)" % (name, subtitle, abv, desc))

        except:
            print "\033[91m'%s'\033[0m has invalid page composition." % (url)

    for entry in entries[:-1]:
        print '\033[92m%s,\033[0m' % (entry)
    else:
        print '\033[92m%s;\033[0m' % (entries[-1])
    print '%s links were successfully parsed.' % (len(entries))

if __name__ == '__main__':
    main()
