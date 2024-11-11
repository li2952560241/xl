import request from '@/utils/request'

// 查询积分证明材料列表
export function listProofs(query) {
  return request({
    url: '/laboratory/proofs/list',
    method: 'get',
    params: query
  })
}

// 查询积分证明材料详细
export function getProofs(materialId) {
  return request({
    url: '/laboratory/proofs/' + materialId,
    method: 'get'
  })
}

// 新增积分证明材料
export function addProofs(data) {
  return request({
    url: '/laboratory/proofs',
    method: 'post',
    data: data
  })
}

// // 修改积分证明材料
export function updateProofs(data) {
  return request({
    url: '/laboratory/proofs/update',
    method: 'put',
    data: data
  })
}
// 认定积分
export function updateCognizanceProofs(data) {
  return request({
    url: '/laboratory/proofs/cognizance',
    method: 'put',
    data: data
  })
}

// 删除积分证明材料
export function delProofs(materialId) {
  return request({
    url: '/laboratory/proofs/' + materialId,
    method: 'delete'
  })
}
