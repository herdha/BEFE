import mock from './mock'

// Master Data
import './jwt'
import './masterdata/items'
import './masterdata/users'

// forwards the matched request over network
mock.onAny().passThrough()
