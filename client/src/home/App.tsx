import React from 'react'
import { CssBaseline } from '@mui/material'

import Layout from '../layout/home'
import MemoCard from './components/MemoCard'

const App: React.VFC<{}> = () => {
  return (
    <>
      <CssBaseline />
      <Layout title="メモ一覧">
        <MemoCard title="あああ" content="ほげえ" />
      </Layout>
    </>
  )
}

export default App
