pub struct CircularBuffer<T> {
    start: usize,
    count: usize,
    data: Box<[T]>,
}

#[derive(Debug, PartialEq, Eq)]
pub enum Error {
    EmptyBuffer,
    FullBuffer,
}

impl<T: Default + Clone> CircularBuffer<T> {
    pub fn new(capacity: usize) -> Self {
        CircularBuffer {
            start: 0,
            count: 0,
            data: vec![Default::default(); capacity].into_boxed_slice(),
        }
    }

    pub fn write(&mut self, element: T) -> Result<(), Error> {
        if self.is_full() {
            return Err(Error::FullBuffer);
        }
        self.data[self.index()] = element;
        self.count += 1;
        Ok(())
    }

    pub fn read(&mut self) -> Result<T, Error> {
        if self.is_empty() {
            return Err(Error::EmptyBuffer);
        }
        let element = self.data[self.start].clone();
        self.incr();
        self.count -= 1;
        Ok(element)
    }

    pub fn clear(&mut self) {
        self.start = 0;
        self.count = 0;
        self.data = vec![Default::default(); self.data.len()].into_boxed_slice();
    }

    pub fn overwrite(&mut self, element: T) {
        self.data[self.index()] = element;
        if self.is_full() {
            self.incr();
        } else {
            self.count += 1;
        }
    }

    fn is_empty(&self) -> bool {
        self.count == 0
    }

    fn is_full(&self) -> bool {
        self.count == self.data.len()
    }

    fn index(&self) -> usize {
        (self.start + self.count) % self.data.len()
    }

    fn incr(&mut self) {
        self.start = (self.start + 1) % self.data.len()
    }
}
