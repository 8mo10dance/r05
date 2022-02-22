import React from 'react'
import { CssBaseline } from '@mui/material'

import Layout from '../layout/home'

const App: React.VFC<{}> = () => {
  return (
    <>
      <CssBaseline />
      <Layout title="メモ一覧">
        <h1>hoge</h1>
      </Layout>
    </>
  )
}

export default App
