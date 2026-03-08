package circular

import (
	"errors"
	"io"
)

type Buffer struct {
	start int
	count int
	data  []byte
}

func NewBuffer(size int) *Buffer {
	return &Buffer{
		start: 0,
		count: 0,
		data:  make([]byte, size),
	}
}

func (b *Buffer) ReadByte() (byte, error) {
	if b.isEmpty() == true {
		return 0, io.EOF
	}
  elem := b.data[b.start]
	b.incr()
	b.count--
  return elem, nil
}

func (b *Buffer) WriteByte(c byte) error {
	if b.isFull() == true {
		return errors.New("buffer is full")
	}
	b.data[b.idx()] = c
	b.count++
	return nil
}

func (b *Buffer) Overwrite(c byte) {
	b.data[b.idx()] = c
	if b.isFull() == true {
		b.incr()
	} else {
		b.count++
	}
}

func (b *Buffer) Reset() {
	b.start = 0
	b.count = 0
}

func (b *Buffer) incr() {
	b.start = (b.start + 1) % len(b.data)
}

func (b *Buffer) idx() int {
	return (b.start + b.count) % len(b.data)
}

func (b *Buffer) isEmpty() bool {
	return b.count == 0
}

func (b *Buffer) isFull() bool {
	return b.count == len(b.data)
}
