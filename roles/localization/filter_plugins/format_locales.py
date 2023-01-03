import re


class FilterModule(object):
    def filters(self):
        return {
            'langcode': self.langcode,
            'encoding': self.encoding,
            'encoding2lower': self.encoding2lower,
        }

    def langcode(self, locales):
        return re.sub(r"(.*)\..*", r"\1", locales)

    def encoding(self, locales):
        return re.sub(r".*\.(.*)", r"\1", locales)

    def encoding2lower(self, locales):
        match = re.match(r"(.*)\.(.*)", locales)
        if match:
            return match.group(1) + "." + match.group(2).replace("-", "").lower()
        return locales
