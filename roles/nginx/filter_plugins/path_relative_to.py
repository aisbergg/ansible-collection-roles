from pathlib import Path


class FilterModule(object):

    def filters(self):
        return {'path_relative_to': self.path_relative_to}

    def path_relative_to(self, path, *other):
        return str(Path(path).relative_to(*other))
